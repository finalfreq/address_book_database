require('spec_helper')

describe(Email) do


    describe('#save') do
      it('saves the Email to the array of saved Emails') do
        email1 = Email.new(type: "work", email: "john@gmail.com", contact_id: 1)
        email1.save()
        expect(Email.all()).to(eq([email1]))
      end
    end

    describe('.all') do
      it('Is empty at first')  do
        expect(Email.all()).to(eq([]))
      end
    end

    describe('#==') do
      it("is the same Email if it has the same first & last name") do
        email1 = Email.new(type: "work", email: "John@john.com", contact_id: 1)
        email2 = Email.new(type: "work", email: "John@john.com", contact_id: 1)
        expect(email1).to(eq(email2))
      end
    end

  end
