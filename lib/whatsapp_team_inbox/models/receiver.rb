# frozen_string_literal: true

module WhatsappTeamInbox
  module Models
    # `receivers` object
    class Receiver
      attr_reader :whatsapp_number, :custom_params

      def initialize(whatsapp_number:, custom_params: {})
        @whatsapp_number = whatsapp_number
        @custom_params = custom_params.map { |k, v| { name: k.to_s, value: v.to_s } }
      end

      def as_param
        {
          "whatsappNumber" => whatsapp_number,
          "customParams" => custom_params.map { |param| { "name" => param[:name], "value" => param[:value] } }
        }
      end
    end
  end
end
