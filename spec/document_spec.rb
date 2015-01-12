require 'spec_helper'

describe TryPaper::Document do

  it 'should exist' do
    file = File.read('~/Documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    expect(doc).to be_a(TryPaper::Document)
  end

  it 'should accept a file when initialized' do
    file = File.read('~/Documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    expect(doc.file).to eq(file)
  end

  it 'should Base64 encode the file' do
    file = File.read('~/Documents/mac.pdf')
    doc = TryPaper::Document.new(file)
    expect(doc.base64format).to be_a(String)
  end

end
