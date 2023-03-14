require_relative 'person'
require_relative 'capitalize'
require_relative 'trimmer'

puts person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
puts capitalize_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalize_trimmed_person.correct_name
