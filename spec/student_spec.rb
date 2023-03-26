require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  student_one = Student.new(31, nil, 'francisco')
  student_two = Student.new(17, nil, 'miguel')

  context 'Testing Student Class' do
    it 'creates a new instance of the student class' do
      expect(student_one).to be_instance_of(Student)
    end
  end

  context 'Test the play_hooky method' do
    it 'play_hooky' do
      expect(student_two.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
