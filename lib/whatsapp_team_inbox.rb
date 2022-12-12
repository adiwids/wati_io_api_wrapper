# frozen_string_literal: true

require "whatsapp_team_inbox/configuration"
require "whatsapp_team_inbox/models/receiver"
require "whatsapp_team_inbox/api/v1/send_template_messages"

# WhatsApp services API wrapper module based on WATI.io documentation
module WhatsappTeamInbox
  extend Configuration

  class << self
    def post(path, params = {})
      Typhoeus::Request.new(
        "#{endpoint}/#{path}",
        method: :post,
        body: params.to_json,
        headers: {
          "Authorization" => "Bearer #{auth_token}",
          "Content-Type" => "application/json"
        }
      )
    end
  end

  WhatsappTeamInbox::Receiver = WhatsappTeamInbox::Models::Receiver
  WhatsappTeamInbox::SendTemplateMessages = WhatsappTeamInbox::Api::V1::SendTemplateMessages
end
