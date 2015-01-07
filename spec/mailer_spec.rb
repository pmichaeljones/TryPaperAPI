require 'spec_helper'
require 'pry'

describe TryPaper::Mailer do
  subject { TryPaper::Mailer }

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

  it 'should send encoded document to TryPaper' do
    TryPaper::Mailer.new(TEST_API_KEY)

  end


end

