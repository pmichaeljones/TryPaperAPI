require 'json'
require 'net/http'

module TryPaper
  class InvalidRecipientError < StandardError; end
  class InvalidAPIKeyError < StandardError; end

  #the Mailer class takes an instance of the document class and sends it to the TryPaper API
  class Mailer
    API_URL = "https://api.trypaper.com/Mailing"

    attr_accessor :document, :recipient
    attr_reader :api_key, :return_address_id, :tags

    # instantiate client and then add document and recipient
    def initialize(api_key, return_address_id, tags = [])
      @recipient = TryPaper::Recipient.new
      @document = nil
      @api_key = api_key
      @return_address_id = return_address_id
      @tags = tags
    end

    def send_data
      {
        "ReturnAddressId" => return_address_id,
        "Tags" => tags,
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
      request['Authorization'] = api_key
      request['Content-Type'] = "application/json"

      request.body = send_data.to_json
      response = http.request(request)
    end

  end

end
