# frozen_string_literal: true

require "spec_helper"

RSpec.describe WhatsappTeamInbox::Api::V1::SendTemplateMessages do
  describe ".call" do
    before do
      Typhoeus.stub("#{WhatsappTeamInbox.endpoint}/#{described_class::PATH}").and_return(mock_response)
    end

    after { Typhoeus::Expectation.clear }

    let(:receiver) do
      WhatsappTeamInbox::Models::Receiver.new(whatsapp_number: "+60125683038", custom_params: { name: "John Doe" })
    end

    let(:mock_response) do
      Typhoeus::Response.new(response_code: 200, response_body: json_string)
    end

    let(:test_request) do
      described_class.call(template_name: "nhitest",
                           broadcast_name: "nhitest_rspec",
                           receivers: [receiver])
    end

    context "when success" do
      let(:json_string) { file_fixture("send_template_messages_success.json").read }

      it { expect(test_request.response_code).to be(200) }

      it { expect(JSON.parse(test_request.response_body)["result"]).to be_truthy }
    end

    context "with invalid custom params" do
      let(:json_string) { file_fixture("send_template_messages_bad_request.json").read }

      it { expect(test_request.response_code).to be(200) }

      it { expect(JSON.parse(test_request.response_body)["result"]).to be_falsey }

      it { expect(JSON.parse(test_request.response_body)["errors"]).to be_any }
    end

    context "with invalid WhatsApp number" do
      let(:json_string) { file_fixture("send_template_messages_invalid_number.json").read }

      it { expect(test_request.response_code).to be(200) }

      it { expect(JSON.parse(test_request.response_body)["result"]).to be_falsey }

      it { expect(JSON.parse(test_request.response_body).dig("errors", "invalidWhatsappNumbers")).to be_any }
    end
  end
end
