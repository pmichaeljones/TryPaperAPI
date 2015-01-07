# Enable setting and getting of configuration options.
#
# Example:
#
#   This can now be used under config/initializers/trypaperapi.rb
#   TryPaper.configure do |config|
#     config.api_key = 'dfskljkf'
#   end

module TryPaper

  class Configuration

    attr_accessor :api_key

    def initialize
    end

  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

end