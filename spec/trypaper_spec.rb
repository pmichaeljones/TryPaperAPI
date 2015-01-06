require 'spec_helper'

describe TryPaper do

  it 'should exist' do
    mailing = TryPaper::Mailing.new
    expect(mailing).to be_kind_of(TryPaper::Mailing)
  end

end