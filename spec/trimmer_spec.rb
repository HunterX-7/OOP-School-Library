require_relative '../classes/trimmer'
require_relative '../classes/teacher'

describe TrimmerDecorator do
  teacher_one = Teacher.new(31, nil, name: 'FranciscoQuintero')
  teacher_two = Teacher.new(17, nil, name: 'miguel')

  context 'Testing the Trimmer method' do
    it 'removes characters in a name if it too long' do
      trimm_one = TrimmerDecorator.new(teacher_one)
      trimm_two = TrimmerDecorator.new(teacher_two)
      expect(trimm_one.correct_name).to eql('FranciscoQ')
      expect(trimm_two.correct_name).to eql('miguel')
    end
  end
end
