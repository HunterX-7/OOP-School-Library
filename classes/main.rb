require_relative 'app'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

def main
    run = App.new
    run.start
    puts 'Hope you have a great day, thank you for using the School Library App'
end

main
