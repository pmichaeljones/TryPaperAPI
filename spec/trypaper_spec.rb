require 'spec_helper'

describe TryPaper do

  it 'should exist' do
    mailing = TryPaper::Mailing.new
    expect(mailing).to be_kind_of(TryPaper::Mailing)
  end

  it 'should accept API key' do
    api_key = "12345"
    mailing = TryPaper::Mailing.new(api_key, api_token)
    expect(mailing.api_key).to eq(api_key)
  end

end