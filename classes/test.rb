require_relative 'person'
require_relative 'capitalize'
require_relative 'trimmer'

puts person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
puts capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name