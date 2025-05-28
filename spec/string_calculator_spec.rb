require 'string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'returns 0 for empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number for single number' do
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns sum for two numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end
  end
end
