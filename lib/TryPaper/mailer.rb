module TryPaper

  #the Mailer class takes an instance of the document class and sends it to the TryPaper API
  class Mailer
    require 'json'
    require 'pry'

    API_URL = "https://api.trypaper.com/Mailing"

    attr_accessor :document, :recipient

    def initialize(recipient, document, tags = {})
      @recipient = recipient
      @document = document
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
      response
    end

  end

end
