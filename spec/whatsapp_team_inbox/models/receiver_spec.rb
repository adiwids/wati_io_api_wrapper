# frozen_string_literal: true

require "spec_helper"

RSpec.describe WhatsappTeamInbox::Models::Receiver do
  let(:receiver) { described_class.new(whatsapp_number: "+60125683038", custom_params: custom_params) }

  let(:custom_params) do
    { my_name: "John Doe" }
  end

  describe "#as_param" do
    let(:params) { receiver.as_param }

    let(:custom_param) { params["customParams"].first }

    it { expect(params.keys).to match_array(%w[whatsappNumber customParams]) }

    it { expect(custom_param.keys).to match_array(%w[name value]) }

    it { expect(custom_param["name"]).to eql("my_name") }

    it { expect(custom_param["value"]).to eql(custom_params[:my_name]) }
  end
end
