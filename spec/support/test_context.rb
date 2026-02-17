# frozen_string_literal: true

require 'webmock'
require 'json'
require 'kombo'

module TestSupport
  CapturedRequest = Struct.new(:method, :path, :headers, :body, keyword_init: true)

  class TestContext
    attr_reader :kombo

    def initialize(api_key: 'test-api-key', integration_id: 'test-integration-id')
      @captured_requests = []
      @api_key = api_key
      @integration_id = integration_id
      @stubs = []

      security = Kombo::Models::Shared::Security.new(api_key: api_key)
      @kombo = Kombo::Kombo.new(
        security: security,
        integration_id: integration_id == :undefined ? nil : integration_id
      )

      # Set up WebMock callback to capture requests
      @callback = lambda do |request_signature, _response|
        headers_hash = {}
        request_signature.headers&.each do |key, value|
          headers_hash[key] = value.is_a?(Array) ? value.first : value
        end

        body = nil
        if request_signature.body
          begin
            body = JSON.parse(request_signature.body)
          rescue JSON::ParserError
            body = request_signature.body
          end
        end

        # Build full path with query string
        # WebMock's request_signature.uri should have the query
        uri = request_signature.uri
        full_path = uri.path
        # Try to get query from uri.query first
        if uri.respond_to?(:query) && uri.query && !uri.query.empty?
          full_path += "?#{uri.query}"
        # Fallback: try to extract from the URI string representation
        elsif uri.to_s.include?('?')
          uri_str = uri.to_s
          path_start = uri_str.index(uri.path)
          if path_start
            full_path = uri_str[path_start..-1]
            # Remove fragment if present
            full_path = full_path.split('#').first
          end
        end

        captured = CapturedRequest.new(
          method: request_signature.method.to_s.upcase,
          path: full_path,
          headers: headers_hash,
          body: body
        )
        @captured_requests << captured
      end

      WebMock.after_request(&@callback)
    end

    def mock_endpoint(method:, path:, response:, delay_response_ms: nil)
      status_code = response[:status_code] || 200
      body = response[:body]
      headers = response[:headers] || {}

      # Set Content-Type header for JSON responses (unless overridden)
      if body.is_a?(Hash) && !headers['Content-Type']
        headers['Content-Type'] = 'application/json'
      end

      # For GET requests, match the base path with any query parameters
      # WebMock matches stubs in order, so multiple stubs for the same path
      # will be matched sequentially. Use times(1) to ensure each stub only matches once.
      if method == 'GET'
        # Use regex to match path with any query params
        stub = WebMock.stub_request(method.downcase.to_sym, /^https:\/\/api\.kombo\.dev#{Regexp.escape(path)}(\?.*)?$/)
          .to_return(
            status: status_code,
            body: body.to_json,
            headers: headers
          )
          .times(1)
      else
        stub = WebMock.stub_request(method.downcase.to_sym, "https://api.kombo.dev#{path}")
          .to_return(
            status: status_code,
            body: body.to_json,
            headers: headers
          )
          .times(1)
      end

      @stubs << stub
    end


    def get_requests
      @captured_requests.dup
    end

    def get_last_request
      request = @captured_requests.last
      raise 'No requests captured!' unless request

      request
    end

    def clear
      @captured_requests.clear
      @stubs.clear
      WebMock.reset!
      # Re-register the callback after reset
      WebMock.after_request(&@callback) if @callback
    end
  end

  def self.describe_sdk_suite(name, &block)
    RSpec.describe name do
      before(:all) do
        WebMock.disable_net_connect!(allow_localhost: true)
      end

      after(:each) do
        WebMock.reset!
      end

      after(:all) do
        WebMock.allow_net_connect!
      end

      instance_eval(&block)
    end
  end
end

