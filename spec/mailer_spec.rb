require 'spec_helper'

# Testing the class here
describe TryPaper::Mailer do

  let(:mailing){TryPaper::Mailer.new(TEST_API_KEY, RETURN_ADDRESS_ID)}

  it 'should exist' do
    expect(mailing).to be_kind_of(TryPaper::Mailer)
  end

  it 'should have a recipient setter method' do
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54323")
    mailing.recipient = recipient
    expect(mailing.recipient).to eq(recipient)
  end

  it 'should have a document setter method' do
    file = File.read('../../Documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    mailing.document = doc
    expect(mailing.document).to eq(doc)
  end

  it 'should accept an optional array as the last argument' do
    mailing = TryPaper::Mailer.new(TEST_API_KEY, RETURN_ADDRESS_ID, ["triplicate", "duplicate"])
    expect(mailing.tags).to eq(["triplicate", "duplicate"])
  end

  context 'with a correct(pdf) document type' do
    file = File.read('../../Documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")

    subject { TryPaper::Mailer.new(TEST_API_KEY, RETURN_ADDRESS_ID) }

    it 'should receive a 201 response with successful send' do
      VCR.use_cassette('pdf_document') do
        subject.document = doc
        subject.recipient = recipient
        response = subject.submit
        expect(response.code).to eq("201")
      end
    end

  end

  context 'with wrong document type' do
    file = File.read('./spec/documents/input_document.txt')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")

    subject { TryPaper::Mailer.new(TEST_API_KEY, RETURN_ADDRESS_ID) }

    it 'should receive a 404 error on bad document' do
      VCR.use_cassette('bad_document') do
        subject.document = doc
        subject.recipient = recipient
        response = subject.submit
        expect(response.code).to eq("400")
      end
    end
  end

  context 'with correct optional tags added' do
    file = File.read('../../Documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    recipient = TryPaper::Recipient.new("Patrick Jones", "555 Main Street", "Apt 1", "Denver", "CO", "54345")

    subject { TryPaper::Mailer.new(TEST_API_KEY, RETURN_ADDRESS_ID, ["force_bw", "triplicate_contents"]) }

    it 'should receive a 201 response with successful send' do
      VCR.use_cassette('good_document_with_tags') do
        subject.document = doc
        subject.recipient = recipient
        response = subject.submit
        expect(response.code).to eq("201")
      end
    end
  end

end

