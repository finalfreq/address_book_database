class Email

  attr_reader(:type, :email, :contact_id)

  define_method(:initialize) do |attributes|
    @email = attributes.fetch(:email)
    @contact_id= attributes.fetch(:contact_id)
    @type = attributes.fetch(:type)
  end


  define_singleton_method(:all) do
    returned_emails = DB.exec("SELECT * FROM emails;")
    emails = []
    returned_emails.each() do |item|
      email = item.fetch("e_address")
      contact_id = item.fetch("contact_id").to_i()
      type = item.fetch("type")
      emails.push(Email.new(type: type, email: email, contact_id: contact_id))
    end
  emails
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO emails (type, e_address, contact_id) VALUES ('#{@type}', '#{@email}', #{@contact_id}) ;")
  end

  define_method(:==) do |another_email|
    self.email().==(another_email.email()).&(self.contact_id().==(another_email.contact_id()))
  end

end
