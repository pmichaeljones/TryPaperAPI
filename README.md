# TryPaperAPI
---

A gem for TryPaper API. Use when you need to print and mail letters via USPS.

Gem requires API keys from [TryPaper.com](http://trypaper.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'TryPaper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install TryPaper

## Usage

Instantiate the client with API and return address ID(both created in the TryPaper dashboard):

```ruby
return_address_id = "main_street_headquarters"
api_key = "AAABBDDCCDDSS"
client = TryPaper::Mailer.new(api_key, return_address_id)
```

Add optional printing tags array if desired. See [available tags here.](http://docs.trypaper.com/article/36-mailing-tags)

```ruby
return_address_id = "main_street_headquarters"
api_key = "AAABBDDCCDDSS"
client = TryPaper::Mailer.new(api_key, return_address_id, ["force_bw", "duplicate_contents"])
```

Set the recipient value(leave address2 blank if needed):

```ruby
client.recipient.configure do |r|
  r.name = "Patrick Jones"
  r.address1 = "555 Main Street"
  r.address2 = "Apartment #3"
  r.city = "Denver"
  r.state = "CO"
  r.zipcode = "55555"
end
```

Read PDF document into variable and load into client:

```ruby
file = File.read('./documents/business_report.pdf')
doc = TryPaper::Document.new(file)
client.document = doc
```

Submit document to TryPaperAPI
```ruby
client.submit
```

Check [TryPaper API logs](https://www.trypaper.com/Printroom/APIHistory) to see printing status (document recieved, printing, printed, mailed, etc).

## Contributing

1. Fork it ( https://github.com/pmichaeljones/TryPaperAPI/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
