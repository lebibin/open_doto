# frozen_string_literal: true
require 'spec_helper'
describe OpenDoto::API::Player do
  describe 'new(account_id)' do
    subject(:client) { OpenDoto::API::Player.new(valid_account_id) }
    describe '#show' do
      it 'returns OpenDoto::Player' do
        VCR.use_cassette 'open_doto/player/valid' do
          expect(subject.show).to be_a(OpenDoto::Player)
        end
      end
    end
  end
  context 'with valid account_id' do
    describe '.find(account_id)' do
      let(:player) do
        VCR.use_cassette 'open_doto/player/valid' do
          OpenDoto::API::Player.find(valid_account_id)
        end
      end
      it 'returns OpenDoto::Player' do
        expect(player).to be_a(OpenDoto::Player)
      end
    end
    describe '.wl(account_id)' do
      let(:player_record) do
        VCR.use_cassette 'open_doto/player/valid_wl' do
          OpenDoto::API::Player.wl(valid_account_id)
        end
      end
      it 'returns OpenDoto::PlayerRecord' do
        expect(player_record).to be_a(OpenDoto::PlayerRecord)
      end
    end
    context 'with invalid account_id' do
      it '.find(account_id) raises ArgumentError' do
        player = proc { OpenDoto::API::Player.find('') }
        expect(player).to raise_error(ArgumentError)
      end
      it '.wl(account_id) raises ArgumentError' do
        player = proc { OpenDoto::API::Player.wl('') }
        expect(player).to raise_error(ArgumentError)
      end
    end
  end
end
