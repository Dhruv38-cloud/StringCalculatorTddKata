require_relative '../lib/string_calculator'

RSpec.describe 'StringCalculator' do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'return number for an its numbric string' do
      expect(StringCalculator.add("6")).to eq(6)
    end
  end
end