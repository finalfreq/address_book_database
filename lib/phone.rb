class Phone

  attr_reader(:number, :type, :contact_id)

  define_method(:initialize) do |attributes|
    @contact_id = attributes.fetch(:contact_id)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
  end

  define_singleton_method(:all) do
    returned_phones = DB.exec("SELECT * FROM phones;")
    phones = []
    returned_phones.each() do |phone|
      number = phone.fetch("number").to_i()
      contact_id = phone.fetch("contact_id").to_i()
      type = phone.fetch("type")
      phones.push(Phone.new(type: type, number: number, contact_id: contact_id))
    end
  phones
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO phones (type, number, contact_id) VALUES ('#{@type}', #{@number}, #{@contact_id}) ;")
  end

  define_method(:==) do |another_phone|
    self.number().==(another_phone.number()).&(self.contact_id().==(another_phone.contact_id()))
  end

end
