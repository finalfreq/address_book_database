class Contact

  attr_reader(:first_name, :last_name, :id)

  define_method(:initialize) do |attributes|
    @first = attributes.fetch(:first_name)
    @last = attributes.fetch(:last_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_contacts = DB.exec("SELECT * FROM contacts;")
    contacts = []
    returned_contacts.each() do |contact|
      first = contact.fetch("first_name")
      last = contact.fetch("last_name")
      id = contact.fetch("id")
      contacts.push(Contact.new(first_name: first, last_name: last, id: id))
    end
  contacts
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO contacts (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;" )
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_contact|
    self.first_name().==(another_contact.first_name()).&(self.last_name().==(another_contact.last_name()))
  end



end
