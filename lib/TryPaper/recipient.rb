module TryPaper

  # address object for recipient address
  class Recipient

    class InvalidDataError < StandardError; end

    attr_accessor :name, :address1, :address2, :city, :state, :zipcode
    attr_reader :formatted_address

    def initialize(name = "", address1 = "", address2 = "", city = "", state = "", zip = "")
      @name = name
      @address1 = address1
      @address2 = address2
      @city = city
      @state = state
      @zipcode = zip
    end

    def formatted_address
      check_attributes
      {
        "Name" => name,
        "AddressLineOne" => address1,
        "AddressLineTwo" => address2,
        "City" => city,
        "Province" => state,
        "PostalCode" => zipcode
      }
    end

    # set up recipient configuration prior to submission
    def configure
      yield self
    end

    private

    def check_attributes
      [name, address1, address2, city, state, zipcode].each do |field|
        raise InvalidDataError, "Recipient attributes must strings" if field.class != String
      end
    end

  end

end










