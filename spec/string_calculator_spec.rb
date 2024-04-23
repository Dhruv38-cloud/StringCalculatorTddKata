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

    it "change delimiter at the beginning of the string" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//#\n1\n2,3")).to eq(6)
    end

    it "return invalid input with delimiter" do
      expect { StringCalculator.add("//;\n1;\n1") }.to raise_error(ArgumentError)
    end

    it "throws an exception for a single negative number" do
      expect { StringCalculator.add('-1') }.to raise_error(ArgumentError, "Negative numbers not allowed: -1")
    end

    it "throws an exception for multiple negative numbers" do
      expect { StringCalculator.add('-1,-2,-3') }.to raise_error(ArgumentError, "Negative numbers not allowed: -1, -2, -3")
    end

    it "raises ArgumentError for non-string input" do
      expect { StringCalculator.add(1) }.to raise_error(ArgumentError, "Input should be string")
    end
  end
end