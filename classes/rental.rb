require_relative 'person'
require_relative 'book'
require 'json'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.add_rental(self)

    @person = person
    person.add_rental(self)
  end

  def to_json(*_args)
    hash = { date: @date, book: @book, person: @person }
    hash.to_json
  end
end
