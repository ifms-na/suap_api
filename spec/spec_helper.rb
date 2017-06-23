require "bundler/setup"
require "json_spec"
require "suap_api"
require 'vcr'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Configuration JsonSpec
  config.include JsonSpec::Helpers

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.extend VCR::RSpec::Macros

  VCR.configure do |config|
    config.cassette_library_dir = "fixtures/vcr_cassettes"
    config.hook_into :webmock
  end
end
