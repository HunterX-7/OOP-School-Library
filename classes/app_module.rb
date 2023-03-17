require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

module Persons
  def add_student
    puts 'Enter the Student info here!'
    puts 'Enter the Student Name:'
    name = gets.chomp
    puts 'Enter the Student Age:'
    age = gets.chomp.to_i
    permit = if age >= 18
               true
             else
               permission
             end
    person = Student.new(age, name, parent_permission: permit)
    @people.push(person)
    puts 'The Student has been successfully created.'
  end

  def permission
    puts 'Does Student has parent permission? [Y/N]:'
    question = gets.chomp.downcase
    return true if question == 'y'

    false
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
end
