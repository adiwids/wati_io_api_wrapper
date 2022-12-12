# frozen_string_literal: true

require "typhoeus"
require "simplecov"
require "whatsapp_team_inbox"

module FixtureHelper
  def file_fixture(filename)
    spec_root_dir = File.expand_path(__dir__)
    fixture_root = File.join(spec_root_dir, "fixtures")

    File.open(File.join(fixture_root, filename))
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FixtureHelper

  # Prepare WATI.io Endpoint and Access Token for testing
  config.before(:suite) do
    WhatsappTeamInbox.configure do |cfg|
      cfg.endpoint = "http://lvm.me"
      cfg.auth_token = "validauthtoken"
    end
  end

  config.after(:suite) do
    WhatsappTeamInbox.configure do |cfg|
      cfg.endpoint = nil
      cfg.auth_token = nil
    end
  end
end

SimpleCov.start
