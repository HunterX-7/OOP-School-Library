require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end

    def start
        loop do
          option = menu   
          if option == 1
            puts book_list
          elsif option == 2
            puts people_list
          elsif option == 3
            create_person
          elsif option == 4
            create_book
          elsif option == 5
            create_rental
          elsif option == 6
            puts person_rentals
          else
            break
          end
          stand_by
        end
    end

    def stand_by
        puts 'Please press any key to proceed.'
        gets.chomp
        puts ''
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

    def select_option(start, close)
      option = ''
      loop do
        option = gets.chomp.to_i
        break if option >= start && option <= close

        print 'Please choose a valid option.'
      end
      option
    end

    def book_list
      list = ''
      if @books == []
        puts 'The book list is empty, create a book!'
      else
        @books.each_with_index do |book, index|
          list << "\n(#{index + 1}) | Title: #{book.title} | Author: #{book.author} |"
        end
        list << "\n\n"
      end
    end
  
    def people_list
      list = ''
      if @people.empty?
        puts 'The persons list is empty, create a person!'
      else
        @people.each_with_index do |person, index|
          if person.is_a?(Student)
            list << "\n(#{index + 1}) [Student] | id:#{person.id} | name: #{person.name} | age: #{person.age} |"
          else
            list << "\n(#{index + 1}) [Teacher] | id:#{person.id} | name: #{person.name} | age: #{person.age} |"
          end
        end
        list << "\n\n"
      end
      list
    end
    
  
    def rental_list
      list = ''
      @rentals.each_with_index do |rental, index|
        list << "\n(#{index + 1}) | book:#{rental.book.title} | owner: #{rental.person.name} | date:#{rental.date} |"
      end
      list << "\n\n"
    end

    def create_book
      puts 'Enter the Book info here!'
      puts 'Enter Book Title:'
      title = gets.chomp
      puts 'Enter Book Author:'
      author = gets.chomp
      book = Book.new(title, author)
      @books.push(book)
      puts 'The Book has been successfully created.'
    end

    def create_person
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
      option = select_option(1,2)
      if option == 1
        add_student
      else 
        add_teacher
      end
    end

    def add_student
      puts 'Enter the Student info here!'
      puts 'Enter the Student Name:'
      name = gets.chomp
      puts 'Enter the Student Age:'
      age = gets.chomp.to_i
      if age >= 18
        permit = true
      else
        permit = permission
      end
      person = Student.new(age, name, parent_permission: permit)
      @people.push(person)
      puts 'The Student has been successfully created.'
    end

    def permission
      puts 'Does Student has parent permission? [Y/N]:'
      question = gets.chomp.downcase
      if question == 'y'
        return true
      else
        return false
      end
    end

    def add_teacher
      puts 'Enter the Teacher info here!'
      puts 'Enter the Teacher Name:'
      name = gets.chomp
      puts 'Enter the Teacher age:'
      age = gets.chomp.to_i
      puts 'Enter the Teacher Specialization:'
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name: name)
      @people.push(person)
      puts 'The Teacher has been successfully created.'
    end

    def create_rental
      puts 'Select a Book number from the following list:'
      puts book_list
      number_book = select_option(1, @books.length)
      select_book = @books[number_book - 1]
      puts 'Select a Person number from the following list:'
      puts people_list
      number_person = select_option(1, @people.length)
      select_person = @people[number_person - 1]
      puts 'Enter the Date of the rental: Date Ex. [2020-12-30]'
      date = gets.chomp
      rental = Rental.new(select_person, select_book, date)
      @rentals.push(rental) unless rental.nil?
      puts 'The Rental has been successfully created.'
    end

    def person_rentals
      if @rentals == []
        puts 'The rentals list is empty, create a rental!'
      else
        puts 'Check the person list, copy and paste the id of a person to check its rentals!'
        id = gets.chomp
        person = @people.find { |person| person.id == id }
        if person.nil?
          puts 'The person with that id does not exist or you made a typo, try again!'
        else
          puts person.rental_list
        end
      end
    end
end