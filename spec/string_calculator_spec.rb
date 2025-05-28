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

    it 'returns sum for multiple numbers' do
      expect(calculator.add('1,2,3,4')).to eq(10)
    end

    it 'returns sum for numbers separated by newlines' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns sum for numbers with custom delimiter' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises error for negative numbers' do
      expect { calculator.add("1,-2") }.to raise_error(/negatives not allowed: -2/)
    end

    it 'raises error for multiple negative numbers' do
      expect { calculator.add("1,-2,-3") }.to raise_error(/negatives not allowed: -2, -3/)
    end
  end

  describe '#get_called_count' do
    it 'returns 0 initially' do
      expect(calculator.get_called_count).to eq(0)
    end

    it 'returns correct count after multiple calls' do
      calculator.add('1')
      calculator.add('2,3')
      expect(calculator.get_called_count).to eq(2)
    end
  end
end
