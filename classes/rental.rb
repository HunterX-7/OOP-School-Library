require_relative 'person'
require_relative 'book'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(person, book, date)
    @person = person
    person.add_rental(self)
    @book = book
    book.add_rental(self)
    @date = date
  end
end
