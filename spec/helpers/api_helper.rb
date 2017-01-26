# frozen_string_literal: true
require 'json'
module ApiHelper
  def player_with(account_id)
    url = URI.parse("http://api.opendota.com/api/players/#{account_id}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request req
    end
    JSON.parse res.body
  end
end
