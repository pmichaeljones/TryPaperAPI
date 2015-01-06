require 'bundler/setup'
Bundler.setup

require 'trypaper' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end

require './lib/trypaper'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
