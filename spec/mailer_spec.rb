require 'spec_helper'
require 'pry'

# Testing the class here
describe TryPaper::Mailer do

  it 'should exist' do
    mailing = TryPaper::Mailer.new(nil, nil)
    expect(mailing).to be_kind_of(TryPaper::Mailer)
  end

  it 'should accept a recipient' do
    file = File.read('./spec/documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")
    mailing = TryPaper::Mailer.new(recipient, doc)
    expect(mailing.recipient).to eq(recipient)
  end

  it 'should accept a document when given' do
    file = File.read('./spec/documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")
    mailing = TryPaper::Mailer.new(recipient, doc)
    expect(mailing.document).to eq(doc)
  end

end

# Testing the API calls here
describe TryPaper::Mailer do
  file = File.read('./spec/documents/mac.pdf')
  doc = TryPaper::Document.new(file)
  recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")

  subject { TryPaper::Mailer.new(recipient, doc) }

  it 'should make a POST request to the TryPaper API' do
    VCR.use_cassette('document') do
      subject.submit
    end
  end

end

