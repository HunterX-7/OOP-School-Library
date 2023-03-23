require_relative 'app'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

def main
  run = App.new
  run.start
  run.save_data
  puts 'Hope you have a great day, thank you for using the School Library App'
end

def menu
  puts 'Welcome to the School Library App!'
  puts 'Please select an option by entering a corresponding number:'
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person.'
  puts '4 - Create a book.'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 - Quit the App'

  select_option(1, 7)
end

main
