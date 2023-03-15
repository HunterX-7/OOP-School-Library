require_relative 'person'
require_relative 'book'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(person, book, date)
    @person = person
    person.rentals << self unless person.rentals.include?(self)

    @book = book
    book.rentals << self unless book.rentals.include?(self)

    @date = date
  end
end
