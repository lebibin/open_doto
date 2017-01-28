# frozen_string_literal: true
require 'spec_helper'
describe OpenDoto::API::Player do
  describe 'new(account_id)' do
    subject(:client) { OpenDoto::API::Player.new('101260776') }
    describe '#show' do
      it 'returns OpenDoto::Player' do
        VCR.use_cassette 'open_doto/player/valid' do
          expect(subject.show).to be_a(OpenDoto::Player)
        end
      end
    end
  end
  describe '.find(account_id)' do
    subject(:player) do
      VCR.use_cassette 'open_doto/player/valid' do
        OpenDoto::API::Player.find('101260776')
      end
    end
    context 'with valid account_id' do
      it 'returns OpenDoto::Player' do
        expect(subject).to be_a(OpenDoto::Player)
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
end
