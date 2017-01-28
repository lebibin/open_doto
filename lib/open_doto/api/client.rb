# frozen_string_literal: true
require 'faraday'
require 'yajl/json_gem'
module OpenDoto
  module API
    # :nodoc:
    class Client
      API_URL = 'https://api.opendota.com/api'
      attr_reader :endpoint, :opts, :response, :status
      def initialize(endpoint = '', opts = {})
        @endpoint = endpoint
        @opts = opts

        validate!
      end

      def get
        url = "#{API_URL}#{@endpoint}"
        @response = Faraday.get(url, opts)
        self
      end

      def parse
        JSON.parse(response.body)
      end

      private

      def validate!
        error = ArgumentError
        message = 'Endpoint is required'
        raise(error, message) if [nil, ''].include?(endpoint)
      end
    end
  end
end
