require "TryPaper/version"

module TryPaper

  #the Mailer class takes an instance of the document class and sends it to the TryPaper API
  class Mailer

    attr_reader :api_key, :document

    def initialize(api_key, document = nil)
      @api_key = api_key
      @document = document
    end



  end

end

