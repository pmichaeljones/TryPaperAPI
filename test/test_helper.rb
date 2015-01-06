# Find File
# Convert into Base64
# POST file to TryPaper API
# Deal with Response & Raise Errors
#

require './lib/trypaper'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
