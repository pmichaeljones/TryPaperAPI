module TryPaper

  # this is a base64 encoded document that will get sent to the mailer class
  class Document

    require 'Base64'

    attr_reader :content, :file

    def initialize(file)
      @file = file
    end

    def content
      Base64.encode64(file)
    end

  end

end
