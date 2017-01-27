# frozen_string_literal: true
require 'spec_helper'
describe OpenDoto::API::Player do
  subject(:player) do
    VCR.use_cassette 'opendoto/player/valid' do
      OpenDoto::API::Player.find('101260776')
    end
  end
  describe '.find(account_id)' do
    context 'with valid account_id' do
      it 'returns OpenDoto::API::Player' do
        expect(subject).to be_a(OpenDoto::API::Player)
      end
      it 'is valid' do
        expect(subject.valid?).to be(true)
      end
    end
    context 'with invalid account_id' do
      it 'returns nil if account_id is nil' do
        player = OpenDoto::API::Player.find(nil)
        expect(player).to be_nil
      end
      it 'returns nil if account_id is blank' do
        player = OpenDoto::API::Player.find('')
        expect(player).to be_nil
      end
    end
  end
  specify '#account_id' do
    expect(subject.account_id).to eq(101_260_776)
  end
  describe '#avatar' do
    it 'returns original size by default' do
      expect(subject.avatar).to eq('https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/85/85f3087786e23098f4c0c65d926f0d50e4e457a6.jpg')
    end
    it 'returns medium with :medium parameter' do
      expect(subject.avatar(:medium)).to eq('https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/85/85f3087786e23098f4c0c65d926f0d50e4e457a6_medium.jpg')
    end
    it 'returns full with :full parameter' do
      expect(subject.avatar(:full)).to eq('https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/85/85f3087786e23098f4c0c65d926f0d50e4e457a6_full.jpg')
    end
  end
  specify '#cheese' do
    expect(subject.cheese).to eq(0)
  end
  specify '#last_login_at' do
    expect(subject.last_login_at).to eq('2016-12-12T15:53:11.521Z')
  end
  specify '#location_country_code' do
    expect(subject.location_country_code).to eq(nil)
  end
  specify '#name' do
    expect(subject.name).to be(nil)
  end
  specify '#party_mmr' do
    expect(subject.party_mmr).to eq('3707')
  end
  specify '#persona_name' do
    expect(subject.persona_name).to eq('KSHHJ')
  end
  specify '#profile_url' do
    expect(subject.profile_url).to eq('http://steamcommunity.com/id/KSHHJ/')
  end
  specify '#solo_mmr' do
    expect(subject.solo_mmr).to eq('4348')
  end
  specify '#steam_id' do
    expect(subject.steam_id).to eq('76561198061526504')
  end
  specify '#untracked_at' do
    expect(subject.untracked_at).to eq(nil)
  end
  describe '#valid?' do
    it 'returns true since it is valid' do
      expect(subject.valid?).to be(true)
    end
  end
end
