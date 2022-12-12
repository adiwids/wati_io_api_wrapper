# frozen_string_literal: true

require "spec_helper"

RSpec.shared_examples "configurable object" do |object|
  let(:configurable) { object.extend(WhatsappTeamInbox::Configuration) }

  it { expect(configurable).to respond_to(:endpoint) }
  it { expect(configurable).to respond_to(:auth_token) }
  it { expect(configurable).to respond_to(:configure) }
end
