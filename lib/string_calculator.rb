class StringCalculator
  def self.add(num_string)
    return 0 if num_string.empty?

    if num_string.include?(',')
      numbers = num_string.split(',').map(&:to_i)
      return numbers.sum
    end

    num_string.to_i
  end
end
