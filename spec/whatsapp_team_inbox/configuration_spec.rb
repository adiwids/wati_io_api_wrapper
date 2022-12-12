# frozen_string_literal: true

require "spec_helper"
require_relative "./shared_examples/configurable_object_spec"

RSpec.describe WhatsappTeamInbox::Configuration do
  include_examples "configurable object", Object.new
end
