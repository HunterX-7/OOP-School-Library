require_relative 'rental'
require 'json'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def rental_list
    list = ''
    @rentals.each { |rental| list << "\n|#{rental.person.name} | #{rental.book.title} | #{rental.date}|" }
    list << "\n\n"
  end

  def to_json(*_args)
    hash = { title: @title, author: @author }
    hash.to_json
  end
end
