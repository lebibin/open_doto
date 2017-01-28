# frozen_string_literal: true
require 'spec_helper'
describe OpenDoto::PlayerRecord do
  subject(:player_record) do
    VCR.use_cassette 'open_doto/player/valid_wl' do
      OpenDoto::API::Player.wl(valid_account_id)
    end
  end
  specify '#wins' do
    expect(subject.wins).to eq(937)
  end
  specify '#losses' do
    expect(subject.losses).to eq(867)
  end
end
