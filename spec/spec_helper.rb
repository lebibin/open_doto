require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'vcr'
require 'open_doto'
require 'helpers/api_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.include ApiHelper
end
