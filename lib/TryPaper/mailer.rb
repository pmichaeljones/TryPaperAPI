module TryPaper

  #the Mailer class takes an instance of the document class and sends it to the TryPaper API
  class Mailer

    API_URL = "https://api.trypaper.com/Mailing"

    attr_reader :api_key
    attr_accessor :document

    def initialize(api_key, document = nil)
      @api_key = api_key
      @document = document
    end

  end



end

uri = URI.parse(API_URL)

# Full control
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri)

#headers
request['Authorization'] = TryPaper.config.api_key
request['Content-Type'] = "application/json"

request.body = send_data.to_json

response = http.request(request)
