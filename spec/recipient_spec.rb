require 'spec_helper'

describe TryPaper::Recipient do

  let(:receiver){TryPaper::Recipient.new}

  it 'should exist' do
    expect(receiver).to be_kind_of(TryPaper::Recipient)
  end

  it 'should have a name setter method' do
    receiver.name = "Patrick"
    expect(receiver.name).to eq("Patrick")
  end

  it 'should have a address1 setter method' do
    receiver.address1 = "555 Main Street"
    expect(receiver.address1).to eq("555 Main Street")
  end

  it 'should have a address2 setter method' do
    receiver.address2 = "Apt 2"
    expect(receiver.address2).to eq("Apt 2")
  end

  it 'should have a city setter method' do
    receiver.city = "Denver"
    expect(receiver.city).to eq("Denver")
  end

  it 'should have a state setter method' do
    receiver.state = "Wisconsin"
    expect(receiver.state).to eq("Wisconsin")
  end

  it 'should have a zipcode setter method' do
    receiver.zipcode = 342353
    expect(receiver.zipcode).to eq(342353)
  end

  it 'should raise error on non-string attribute field' do
    receiver = TryPaper::Recipient.new("Patrick", "555 Main Street", "Apt 1", "Denver", "CO", 55555)
    expect{receiver.formatted_address}.to raise_error
  end

  describe "#formatted_address"  do

    it "should return an address hash" do
      receiver = TryPaper::Recipient.new
      expect(receiver.formatted_address).to be_kind_of(Hash)
    end
  end
end
