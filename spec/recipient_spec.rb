require 'spec_helper'

describe TryPaper::Recipient do

  it 'should exist' do
    receiver = TryPaper::Recipient.new
    expect(receiver).to be_kind_of(TryPaper::Recipient)
  end

  it 'should have a name setter method' do
    receiver = TryPaper::Recipient.new
    receiver.name = "Patrick"
    expect(receiver.name).to eq("Patrick")
  end

  it 'should have a address1 setter method' do
    receiver = TryPaper::Recipient.new
    receiver.address1 = "555 Main Street"
    expect(receiver.address1).to eq("555 Main Street")
  end

  it 'should have a address2 setter method' do
    receiver = TryPaper::Recipient.new
    receiver.address2 = "Apt 2"
    expect(receiver.address2).to eq("Apt 2")
  end

  it 'should have a city setter method' do
    receiver = TryPaper::Recipient.new
    receiver.city = "Denver"
    expect(receiver.city).to eq("Denver")
  end

  it 'should have a province setter method' do
    receiver = TryPaper::Recipient.new
    receiver.province = "Wisconsin"
    expect(receiver.province).to eq("Wisconsin")
  end

  it 'should have a postalcode setter method' do
    receiver = TryPaper::Recipient.new
    receiver.postalcode = 342353
    expect(receiver.postalcode).to eq(342353)
  end

  describe "#formatted_address"  do

    it "should return an address hash" do

    end

  end
end
