# frozen_string_literal: true

require "spec_helper"
require_relative "./whatsapp_team_inbox/shared_examples/configurable_object_spec"

RSpec.describe WhatsappTeamInbox do
  include_examples "configurable object", described_class
end
