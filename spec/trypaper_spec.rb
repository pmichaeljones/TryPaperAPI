require 'spec_helper'

describe TryPaper do

  it 'should exist' do
    new = TryPaper::Mailing.new
    expect(new).to be_kind_of(TryPaper::Mailing)
  end

end