require 'spec_helper'

describe TryPaper::Document do

  it 'should exist' do
    doc = TryPaper::Document.new
    expect(doc).to be_kind_of(TryPaper::Document)
  end

  it 'should accept a file when initialized' do
    file = File.read('./spec/documents/input_text_file.txt')
    doc = TryPaper::Document.new(file)
    expect(doc).to be_kind_of(TryPaper::Mailer)
  end

  it 'should read the file' do
    ##
  end

  it 'should base64 encode the file and store in a variable' do
    ##
  end

end
