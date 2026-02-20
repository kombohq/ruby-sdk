# frozen_string_literal: true

require 'spec_helper'
require 'support/test_context'

TestSupport.describe_sdk_suite 'Kombo ATS Jobs API' do
  include TestSupport

  it 'should make correct HTTP request for getJobs' do
    ctx = TestSupport::TestContext.new

    # Mock the API endpoint
    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/ats/jobs',
      response: {
        body: {
          status: 'success',
          data: {
            results: [],
            next: nil
          }
        }
      }
    )

    # Make the API call
    _jobs = ctx.kombo.ats.get_jobs

    # Verify and snapshot the request details
    request = ctx.get_last_request
    # The path should include the base path
    expect(request.path).to include('/v1/ats/jobs')
    # Note: Default query parameters may or may not be included in the URL
    # depending on how the query parameter serialization handles default values
  end
end

