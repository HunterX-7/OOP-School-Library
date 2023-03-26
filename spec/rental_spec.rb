require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/rental'

describe Rental do
  person_one = Person.new(31, nil, 'francisco')
  book = Book.new('The Divine Comedy', 'Dante Aligheiri')
  rental = Rental.new('2023-06-15', book, person_one)

  context 'Testing the Rental class' do
    it 'creates an instance of the rental class' do
      expect(rental).to be_instance_of(Rental)
    end
  end

  context 'Test the to_json method in Rental' do
    it 'passes the info as a json format to store' do
      to_json_data = '{"class":"Person","id":null,"name":"francisco","age":31,"parent_permission":true}'
      person_one_to_json = person_one.to_json
      expect(person_one_to_json).to eq(to_json_data)
    end
  end
end
