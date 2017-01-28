# frozen_string_literal: true
require 'faraday'
require 'yajl/json_gem'
module OpenDoto
  # :nodoc:
  module API
    # :nodoc:
    class Player
      attr_reader :account_id

      def initialize(account_id)
        @account_id = account_id
      end

      def show
        Player.find(account_id)
      end

      def self.find(account_id)
        return if [nil, ''].include? account_id
        response = player_with account_id
        OpenDoto::Player.new(response)
      end

      private_class_method def self.player_with(account_id)
        endpoint = "http://api.opendota.com/api/players/#{account_id}"
        response = Faraday.get endpoint
        JSON.parse response.body
      end
    end
  end
end
