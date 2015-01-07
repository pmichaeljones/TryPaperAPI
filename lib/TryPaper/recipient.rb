module TryPaper

  # address object for recipient address
  class Recipient

    attr_accessor :name, :address1, :address2, :city, :province, :postalcode
    attr_reader :formatted_address

    def initialize(name = nil, address1 = nil, address2 = nil, city = nil, province = nil, postalcode = nil)
      @name = name
      @address1 = address1
      @address2 = address2
      @city = city
      @province = province
      @postalcode = postalcode
    end

    def formatted_address
      "Recipient" => {
        "Name" => name,
        "AddressLineOne" => address1,
        "AddressLineTwo" => address2,
        "City" => city,
        "Province" => province,
        "PostalCode" => postalcode
      }
    end

  end

end