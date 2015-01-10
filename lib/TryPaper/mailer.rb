require 'json'
require 'pry'
require 'net/http'

module TryPaper
  class WrongDocumentTypeError < StandardError; end
  class InvalidRecipientError < StandardError; end
  class InvalidAPIKeyError < StandardError; end

  #the Mailer class takes an instance of the document class and sends it to the TryPaper API
  class Mailer
    API_URL = "https://api.trypaper.com/Mailing"

    attr_accessor :document, :recipient
    attr_reader :api_key

    # instantiate client and then add document and recipient
    def initialize(api_key)
      @recipient = TryPaper::Recipient.new
      @document = nil
      @api_key = api_key
    end

    def send_data
      {
        "ReturnAddressId" => TryPaper.configuration.return_address,
        "Content" => document.base64format,
        "Recipient" => recipient.formatted_address
      }
    end

    def submit
      uri = URI.parse(API_URL)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)

      #headers
      request['Authorization'] = TryPaper.configuration.api_key
      request['Content-Type'] = "application/json"

      request.body = send_data.to_json
      response = http.request(request)
      # binding.pry
      # case response.message
      # when "Bad Request"
      #   raise WrongDocumentTypeError
      # when "Forbidden"
      #   put "hello"
      # end
    end

  end

end
