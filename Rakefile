# typed: true
# frozen_string_literal: true

require 'bundler/gem_tasks'

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  # RuboCop not available
end

begin
  require 'minitest/test_task'
  Minitest::TestTask.create do |t|
    # workaround to avoid throwing warnings from Janeway library circular require...
    t.warning = false
  end
rescue LoadError
  # Minitest not available
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end
rescue LoadError => e
  # RSpec not available - define a task that explains this
  desc 'Run RSpec tests (requires: bundle install)'
  task :spec do
    puts "\n⚠️  RSpec is not installed. Please run: bundle install"
    puts "   Then run: bundle exec rake spec\n\n"
    raise 'RSpec not available. Run `bundle install` first.'
  end
end

task :default => :test

# Developers can run all tests with:
#
# $ rake test
#
# Developers can run individual test files with:
#
# $ rake test test/parameter_test
#
# and run individual tests by adding `focus` to the line before the test definition.
#
# Developers can run RSpec tests with:
#
# $ rake spec