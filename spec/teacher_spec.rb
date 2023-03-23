require_relative '../classes/teacher'
require_relative '../classes/classroom'

describe Teacher do
  teacher_one = Teacher.new(31, nil, 'francisco')
  teacher_two = Teacher.new(17, nil, 'miguel')

  context 'Testing the Teacher Class' do
    it 'creates an instance of the teacher class' do
      expect(teacher_one).to be_instance_of(Teacher)
    end
  end

  context 'Test the can_use_service method' do
    it 'return true by default in teachers' do
      expect(teacher_two.can_use_services?).to eq(true)
    end
  end
end
