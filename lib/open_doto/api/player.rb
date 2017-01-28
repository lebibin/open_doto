# frozen_string_literal: true
module OpenDoto
  # :nodoc:
  module API
    # :nodoc:
    class Player
      BASE_API_RESOURCE = '/players'
      attr_reader :account_id

      def initialize(account_id)
        @account_id = account_id
      end

      def show
        Player.find(account_id)
      end

      def self.find(account_id)
        return if [nil, ''].include? account_id
        endpoint = "#{BASE_API_RESOURCE}/#{account_id}"
        response = Client.new(endpoint).get
        OpenDoto::Player.new(response.parse)
      end
    end
  end
end
