require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/rental'

describe Book do
  context 'Test the Book class' do
    it 'creates an instance object of the class Book with title and author' do
      book = Book.new('The Divine Comedy', 'Dante Aligheiri')
      expect(book).to be_instance_of(Book)
      expect(book.title).to eq 'The Divine Comedy'
      expect(book.author).to eq 'Dante Aligheiri'
    end
  end

  context 'When testing the add_rental method' do
    it 'adds a rental object to the @rentals attribute' do
      person = Person.new(18)
      book = Book.new('Book1', 'Author1')
      rental = Rental.new('2023-06-15', book, person)
      person.add_rental(rental)
      expect(book.rentals.length).to eq 1
    end
  end


  context 'Test to_json method' do
    it 'passes the object to JSON format' do
      book = Book.new('The Divine Comedy', 'Dante Aligheiri')
      book_to_json = '{"title":"The Divine Comedy","author":"Dante Aligheiri"}'
      expect(book.to_json).to eq(book_to_json)
    end
  end
end
