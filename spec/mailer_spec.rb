require 'spec_helper'
require 'pry'

# Testing the class here
describe TryPaper::Mailer do

  it 'should exist' do
    mailing = TryPaper::Mailer.new(TEST_API_KEY)
    expect(mailing).to be_kind_of(TryPaper::Mailer)
  end

  it 'should have a recipient setter method' do
    file = File.read('./spec/documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")
    mailing = TryPaper::Mailer.new(TEST_API_KEY)
    mailing.recipient = recipient
    expect(mailing.recipient).to eq(recipient)
  end

  it 'should have a document setter method' do
    file = File.read('./spec/documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    mailing = TryPaper::Mailer.new(TEST_API_KEY)
    mailing.document = doc
    expect(mailing.document).to eq(doc)
  end

end

# Testing the API calls here
describe TryPaper::Mailer do

  context 'with a correct(pdf) document type' do
    file = File.read('./spec/documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")

    subject { TryPaper::Mailer.new(TEST_API_KEY) }

    it 'should receive a 201 response with successful send' do
      VCR.use_cassette('pdf_document') do
        subject.document = doc
        subject.recipient = recipient
        response = subject.submit
        expect(response.code).to eq("201")
      end
    end

  end

end

describe TryPaper::Mailer do
  context 'with wrong document type' do
    file = File.read('./spec/documents/input_document.txt')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")

    subject { TryPaper::Mailer.new(TEST_API_KEY) }

    it 'should receive a 404 error on bad document' do
      VCR.use_cassette('bad_document') do
        subject.document = doc
        subject.recipient = recipient
        response = subject.submit
        expect(response.code).to eq("400")
      end
    end

  end
end

