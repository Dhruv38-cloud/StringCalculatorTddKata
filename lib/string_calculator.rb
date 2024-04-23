class StringCalculator
  def self.add(num_string)
    raise ArgumentError, "Input should be string" unless num_string.is_a?(String)

    return 0 if num_string.empty?
    
    return num_string.to_i if is_a_number?(num_string) && !num_string.to_i.negative?
    
    default_delimiter = ','
    
    if num_string.start_with?("//")
      delimiters, numbers = num_string.split("\n", 2)
      custom_delimiter = delimiters[2..-1]
    else
      numbers = num_string
    end
    
    saparate_numbers = saparated_numbers(numbers, custom_delimiter || default_delimiter)

    raise ArgumentError, "Invalid input" if saparate_numbers.any?(&:empty?)

    negative_numbers = saparate_numbers.select { |num| num.to_i.negative? }

    raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    saparate_numbers.map(&:to_i).sum
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

  def self.saparated_numbers(numbers, delimiter)
    numbers.split(/#{Regexp.escape(delimiter)}|,|\n/)
  end
end
