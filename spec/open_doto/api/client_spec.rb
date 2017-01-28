# frozen_string_literal: true
require 'spec_helper'
describe OpenDoto::API::Client do
  context 'when endpoint is valid' do
    let!(:endpoint) { "/players/#{valid_account_id}" }
    subject(:client) { described_class.new(endpoint) }
    describe '#get' do
      it 'makes request' do
        expect(Faraday).to receive(:get)
        subject.get
      end
      it 'is successful' do
        response = VCR.use_cassette 'open_doto/player/valid' do
          subject.get.response
        end
        expect(response.status).to eq(200)
      end
    end
    describe '#parse' do
      it 'parses json response' do
        VCR.use_cassette 'open_doto/player/valid' do
          expect(JSON).to receive(:parse)
          client.get.parse
        end
      end
    end
  end
  context 'when endpoint is invalid' do
    it 'raises ArgumentError when endpoint is nil' do
      client = proc { described_class.new(nil) }
      expect(client).to raise_error(ArgumentError)
    end
    it 'raises ArgumentError when endpoint is blank' do
      client = proc { described_class.new('') }
      expect(client).to raise_error(ArgumentError)
    end
  end
end
