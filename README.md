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

Instantiate the client:

```ruby
api_key = "AAABBDDCCDDSS"
client = TryPaper::Mailer.new(api_key)
```

Set the recipient value(leave address2 blank if needed):

```ruby
client.recipient.configure do |r|
  r.name = "Patrick Jones"
  r.address1 = "555 Main Street"
  r.address2 = "Apartment #3"
  r.city = "Denver"
  r.province = "CO"
  r.postalcode = "55555"
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

## Contributing

1. Fork it ( https://github.com/pmichaeljones/TryPaperAPI/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
