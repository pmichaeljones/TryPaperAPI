require 'spec_helper'
require 'pry'

# Testing the class here
describe TryPaper::Mailer do

  it 'should exist' do
    mailing = TryPaper::Mailer.new(TEST_API_KEY)
    expect(mailing).to be_kind_of(TryPaper::Mailer)
  end

  it 'should accept an API key' do
    mailing = TryPaper::Mailer.new(TEST_API_KEY)
    expect(mailing.api_key).to eq(TEST_API_KEY)
  end

  it 'should accept a document when given' do
    document = Object.new
    mailing = TryPaper::Mailer.new(TEST_API_KEY, document)
    expect(mailing.document).to eq(document)
  end

  it 'should set document to nil when not given' do
    mailing = TryPaper::Mailer.new(TEST_API_KEY)
    expect(mailing.document).to eq(nil)
  end

end

# Testing the API calls here
describe TryPaper::Mailer do
  file = File.read('./spec/documents/input_text_file.txt')
  doc = TryPaper::Document.new(file)

  subject { TryPaper::Mailer.new(TEST_API_KEY, doc) }

  it 'should make a POST request to the TryPaper API' do
    subject.submit
  end

end

