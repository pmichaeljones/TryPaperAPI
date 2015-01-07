module TryPaper

  # address object for recipient address
  class Address

  end

end

send_data = {
  "ReturnAddressId" => "NAME",
  "Tags" => ["triplicate_contents"],
  "Content" => encoded,
  "Recipient" => {
    "Name" => name,
    "AddressLineOne" => business,
    "AddressLineTwo" => address,
    "City" => city,
    "Province" => state,
    "PostalCode" => zip
  }
}
