# frozen_string_literal: true
module OpenDoto
  # :nodoc:
  class PlayerRecord
    attr_reader :response
    def initialize(response)
      @response = response
    end

    def wins
      response['win']
    end

    def losses
      response['lose']
    end
  end
end
