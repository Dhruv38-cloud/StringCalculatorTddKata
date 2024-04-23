class StringCalculator
  def self.add(num_string)
    return 0 if num_string.empty?
    
    return num_string.to_i if is_a_number?(num_string)

    numbers = num_string.split(/[,\n]/)
    raise ArgumentError, 'Invalid input' if numbers&.any?(&:empty?)
    
    return numbers.map(&:to_i).sum
  end

  private

  def self.is_a_number?(string)
    begin
      Integer(string)
      true
    rescue ArgumentError
      false
    end
  end
end
