
class Address

  attr_reader(:street_address, :city, :state, :zip, :contact_id)

  define_method(:initialize) do |attributes|
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @contact_id = attributes.fetch(:contact_id)
  end

  define_singleton_method(:all) do
    returned_addresses = DB.exec("SELECT * FROM addresses;")
    addresses = []
    returned_addresses.each() do |address|
      street_address = address.fetch("street_address")
      contact_id = address.fetch("contact_id").to_i()
      city = address.fetch("city")
      state = address.fetch("state")
      zip = address.fetch("zip_code").to_i()
      addresses.push(Address.new(street_address: street_address, city: city, state: state, zip: zip, contact_id: contact_id))
    end
  addresses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO addresses (street_address, city, state, zip_code, contact_id) VALUES ('#{@street_address}', '#{@city}', '#{@state}', #{@zip}, #{@contact_id}) ;")
  end

  define_method(:==) do |another_address|
    self.street_address().==(another_address.street_address()).&(self.contact_id().==(another_address.contact_id()))
  end
end
