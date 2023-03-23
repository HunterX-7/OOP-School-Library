require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  context 'Test classroom class' do
    it 'creates an instance of class with a label and array of students' do
      classroom = Classroom.new('Science')
      array = []
      expect(classroom).to be_instance_of(Classroom)
      expect(classroom.label).to eq('Science')
      expect(classroom.students).to eq(array)
    end
  end

  context 'Test the add students method' do
    it 'adds a student to the array' do
      classroom = Classroom.new('Science')
      student = Student.new(30, 'arturo')
      classroom.add_student(student)
      array = [student]
      expect(classroom.students).to eq(array)
    end
  end
end
