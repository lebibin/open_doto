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

      def self.find(account_id, opts = {})
        validate!(account_id)
        endpoint = "#{BASE_API_RESOURCE}/#{account_id}"
        response = Client.new(endpoint, opts).get
        OpenDoto::Player.new(response.parse)
      end

      def self.wl(account_id, opts = {})
        validate!(account_id)
        endpoint = "#{BASE_API_RESOURCE}/#{account_id}/wl"
        response = Client.new(endpoint, opts).get
        OpenDoto::PlayerRecord.new(response.parse)
      end

      private_class_method def self.validate!(account_id)
        error = ArgumentError
        message = 'account_id is required'
        raise(error, message) if [nil, ''].include?(account_id)
      end
    end
  end
end
