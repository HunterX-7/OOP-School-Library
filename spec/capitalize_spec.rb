require_relative '../classes/decorator'
require_relative '../classes/capitalize'
require_relative '../classes/person'
require_relative '../classes/teacher'
require_relative '../classes/student'

describe CapitalizeDecorator do
  context 'Test the capitalize decorator' do
    it 'capitalize the first letter of the name object instance of the class Person, Student and Teacher' do
      person = Person.new(30, nil, 'francisco')
      teacher = Teacher.new(30, 'Math', name: 'miguel')
      student = Student.new(30, 'arturo')
      person_capitalize = CapitalizeDecorator.new(person)
      teacher_capitalize = CapitalizeDecorator.new(teacher)
      student_capitalize = CapitalizeDecorator.new(student)
      expect(person_capitalize.correct_name).to eq('Francisco')
      expect(teacher_capitalize.correct_name).to eq('Miguel')
      expect(student_capitalize.correct_name).to eq('Arturo')
    end
  end
end
