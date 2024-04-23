require_relative '../lib/string_calculator'

RSpec.describe 'StringCalculator' do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'return number for an its numbric string' do
      expect(StringCalculator.add("6")).to eq(6)
    end

    it 'return calculated number for an its numbric string which is saparated by comma' do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    it 'return calculated number for an its numbric string with new line which is saparated by comma' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
    
    it 'return invalid input for an its numbric string which is saparated by comma' do
      expect {StringCalculator.add("1,\n2")}.to raise_error(ArgumentError)
    end
  end
end