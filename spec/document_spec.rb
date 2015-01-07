require 'spec_helper'

describe TryPaper::Document do

  it 'should exist' do
    file = File.read('./spec/documents/input_text_file.txt')
    doc = TryPaper::Document.new(file)
    expect(doc).to be_kind_of(TryPaper::Document)
  end

  it 'should accept a file when initialized' do
    file = File.read('./spec/documents/input_text_file.txt')
    doc = TryPaper::Document.new(file)
    expect(doc.file).to eq(file)
  end

  it 'should Base64 encode the file' do
    file = File.read('./spec/documents/input_text_file.txt')
    doc = TryPaper::Document.new(file)
    expect(doc.content).to be_kind_of(String)
  end

end
