require_relative '../classes/person'
require_relative '../classes/book'
require_relative '../classes/rental'

describe Person do
  person_one = Person.new(31, nil, 'francisco')
  person_two = Person.new(17, nil, 'miguel')
  book = Book.new('The Divine Comedy', 'Dante Aligheiri')
  rental = Rental.new('2023-06-15', book, person_one)

  context 'Test Person Class' do
    it 'creates an instance of the Person class' do
      expect(person_one).to be_instance_of(Person)
      expect(person_one.name).to eq('francisco')
      expect(person_one.age).to eq(31)
    end
  end

  context 'Testing can_use_service method' do
    it 'test if the person has parent permission or not by default true' do
      expect(person_one.can_use_services?).to be(true)
      expect(person_two.can_use_services?).to be(true)
    end
  end

  context 'Testing correct_name method' do
    it 'test if the correct_name is adress correctly' do
      expect(person_one.correct_name).to eq('francisco')
      expect(person_two.correct_name).to eq('miguel')
    end
  end

  context 'Test the add_rental method' do
    it 'add a rental to the array' do
      person_one.add_rental(rental)
      array = [rental]
      expect(person_one.rentals).to eq(array)
    end
  end

  context 'Test the to_json method' do
    it 'passes the info as a json format to store' do
      to_json_data = '{"class":"Person","id":null,"name":"francisco","age":31,"parent_permission":true}'
      person_one_to_json = person_one.to_json
      expect(person_one_to_json).to eq(to_json_data)
    end
  end
end
