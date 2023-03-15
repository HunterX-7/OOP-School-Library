require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'


max = Student.new(22, 'maximilianus')
ericka = Student.new(20, 'ericka')

fisica = Classroom.new('Physics')

iliada = Book.new('iliada', 'Homero')
biblia = Book.new('bible', 'Jesus')

book_rent_one = Rental.new(max, biblia, '2020-12-02')
book_rent_two = Rental.new(ericka, iliada, '2022-10-07')

book_rent_one.date
book_rent_two.date

fisica.add_student(max)
ericka.classroom = fisica

puts(fisica.students.each_with_index.map { |student, index| "#{index + 1}. #{student.name}" })

puts(biblia.rentals.map { |rental| rental.person.name })
puts(ericka.rentals.map { |rental| rental.person.name })

puts(max.rentals.map { |rental| rental.date })