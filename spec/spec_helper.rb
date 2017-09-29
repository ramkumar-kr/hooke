require 'bundler/setup'
require 'tmpdir'
require 'simplecov'
SimpleCov.start
SimpleCov.minimum_coverage 99
SimpleCov.minimum_coverage_by_file 99
require 'hooke'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.before do
    allow(STDERR).to receive(:puts)
    allow(STDOUT).to receive(:puts)
    allow(Bundler).to receive(:git_present?).and_return(true)
  end
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Test helpers
def with_tmpdir(&block)
  Dir.mktmpdir do |dir|
    Dir.chdir(dir, &block)
  end
end
