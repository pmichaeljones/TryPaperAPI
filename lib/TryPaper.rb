require_relative "TryPaper/version"
require_relative "TryPaper/configuration"
require_relative "TryPaper/document"
require_relative "TryPaper/recipient"
require_relative "TryPaper/mailer"

TEST_API_KEY = "TPTESTCF24A7D8095EDF88E3EFD6103C"
DEFAULT_RETURN_ADDRESS = "555_Main_Street_Fake_City"

TryPaper.configure do |c|
  c.api_key = TEST_API_KEY
  c.return_address = DEFAULT_RETURN_ADDRESS
end