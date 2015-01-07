module TryPaper

  #the Mailer class takes an instance of the document class and sends it to the TryPaper API
  class Mailer
    require 'json'

    API_URL = "https://api.trypaper.com/Mailing"

    attr_reader :api_key
    attr_accessor :document, :recipient

    def initialize(api_key, recipient, document, tags = {})
      @api_key = api_key
      @recipient = recipient
      @document = document
    end

    def send_data
      {
        "ReturnAddressId" => TryPaper.config.return_address,
        #"Tags" => ["triplicate_contents"],
        "Content" => document.base64format,
        "Recipient" => recipient.formatted_address
      }.to_json
    end

    def submit
      uri = URI.parse(API_URL)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)

      #headers
      request['Authorization'] = api_key
      request['Content-Type'] = "application/json"

      request.body = send_data
      response = http.request(request)
    end

  end

end
