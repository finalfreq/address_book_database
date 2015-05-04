require('spec_helper')


describe(Contact) do
  describe('#save') do
    it('saves the contact to the array of saved contacts') do
      contact1 = Contact.new(first_name: 'james', last_name: 'williams', id: nil)
      contact1.save()
      expect(Contact.all()).to(eq([contact1]))
    end
  end

  describe('.all') do
    it('Is empty at first')  do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same contact if it has the same first & last name") do
      contact1 = Contact.new(first_name: 'james', last_name: 'williams', id: nil)
      contact2 = Contact.new(first_name: 'james', last_name: 'williams', id: nil)
      expect(contact1).to(eq(contact2))
    end
  end

  describe('#id') do
    it("sets the ID when you save it") do
      contact1 = Contact.new(first_name: 'james', last_name: 'williams', id: nil)
      contact1.save()
      expect(contact1.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
