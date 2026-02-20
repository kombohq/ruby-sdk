# frozen_string_literal: true

require 'bundler/setup'
require 'webmock/rspec'
require 'kombo'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Disable network connections by default
  config.before(:suite) do
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  config.after(:each) do
    WebMock.reset!
  end

  config.after(:suite) do
    WebMock.allow_net_connect!
  end
end
