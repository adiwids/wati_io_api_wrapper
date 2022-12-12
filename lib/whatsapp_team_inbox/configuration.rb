# frozen_string_literal: true

module WhatsappTeamInbox
  # Define API endpoint and auth token globally
  module Configuration
    attr_accessor :endpoint, :auth_token

    def configure
      yield self
    end
  end
end
