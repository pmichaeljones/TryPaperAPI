require 'spec_helper'

describe TryPaper::Mailer do

  it 'should exist' do
    api_key = "12345"
    mailing = TryPaper::Mailer.new(api_key)
    expect(mailing).to be_kind_of(TryPaper::Mailer)
  end

  it 'should accept an API key' do
    api_key = "12345"
    mailing = TryPaper::Mailer.new(api_key)
    expect(mailing.api_key).to eq(api_key)
  end

  it 'should accept a document when given' do
    api_key = "12345"
    document = "ENCODED-DOCUMENT"
    mailing = TryPaper::Mailer.new(api_key, document)
    expect(mailing.document).to eq(document)
  end

  it 'should set document to nil when not given' do
    api_key = "12345"
    mailing = TryPaper::Mailer.new(api_key)
    expect(mailing.document).to eq(nil)
  end


end

