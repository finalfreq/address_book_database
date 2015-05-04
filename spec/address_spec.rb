require('spec_helper')

describe(Address) do


    describe('#save') do
      it('saves the address to the array of saved addresses') do
        address1 = Address.new(street_address: "123 blah st", city: "Portland", state: "OR", zip: 97888, contact_id: 1)
        address1.save()
        expect(Address.all()).to(eq([address1]))
      end
    end

    describe('.all') do
      it('Is empty at first')  do
        expect(Address.all()).to(eq([]))
      end
    end

    describe('#==') do
      it("is the same street address and contact_id") do
        address1 = Address.new(street_address: "123 blah st", city: "Portland", state: "OR", zip: 97888, contact_id: 1)
        address2 = Address.new(street_address: "123 blah st", city: "Portland", state: "OR", zip: 97888, contact_id: 1)
        expect(address1).to(eq(address2))
      end
    end

  end
