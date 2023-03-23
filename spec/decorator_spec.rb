require_relative '../classes/decorator'
require_relative '../classes/nameable'

describe Decorator do
  context 'Test the Decorator class' do
    it 'create an instance of decorator class' do
      decorator = Decorator.new('francisco')
      expect(decorator).to be_instance_of(Decorator)
      expect(decorator.nameable).to eq('francisco')
    end
  end
end
