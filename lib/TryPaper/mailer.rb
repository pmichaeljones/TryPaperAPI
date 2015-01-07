module TryPaper

  #the Mailer class takes an instance of the document class and sends it to the TryPaper API
  class Mailer

    API_URL = "https://api.trypaper.com/Mailing"

    attr_reader :api_key
    attr_accessor :document, :recipient

    def initialize(api_key, recipient = nil, document = nil)
      @api_key = api_key
      @recipient = recipient
      @document = document
    end

  end

end
