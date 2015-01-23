require 'spec_helper'

describe TryPaper::Document do

  let(:file){File.read('../../Documents/mac.pdf')}
  let(:doc){TryPaper::Document.new(file)}

  it 'should exist' do
    expect(doc).to be_a(TryPaper::Document)
  end

  it 'should accept a file when initialized' do
    expect(doc.file).to eq(file)
  end

  it 'should Base64 encode the file' do
    expect(doc.base64format).to be_a(String)
  end

end
