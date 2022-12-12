# frozen_string_literal: true

module WhatsappTeamInbox
  module Api
    module V1
      # POST /api/v1/sendTemplateMessages
      class SendTemplateMessages
        PATH = "api/v1/sendTemplateMessages"

        class << self
          # class methods
          def call(template_name:, broadcast_name:, receivers: [])
            request = WhatsappTeamInbox.post(PATH, {
                                               "template_name" => template_name,
                                               "broadcast_name" => broadcast_name,
                                               "receivers" => receivers
                                             })

            block_given? ? yield(request.run) : request.run
          end
        end
      end
    end
  end
end
