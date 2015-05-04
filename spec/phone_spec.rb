require('spec_helper')

describe(Phone) do


    describe('#save') do
      it('saves the phone to the array of saved phones') do
        phone1 = Phone.new(type: "work", number: 5555555555, contact_id: 1)
        phone1.save()
        expect(Phone.all()).to(eq([phone1]))
      end
    end

    describe('.all') do
      it('Is empty at first')  do
        expect(Phone.all()).to(eq([]))
      end
    end

    describe('#==') do
      it("is the same Phone if it has the same first & last name") do
        phone1 = Phone.new(type: "work", number: 5555555555, contact_id: 1)
        phone2 = Phone.new(type: "work", number: 5555555555, contact_id: 1)
        expect(phone1).to(eq(phone2))
      end
    end

  end
