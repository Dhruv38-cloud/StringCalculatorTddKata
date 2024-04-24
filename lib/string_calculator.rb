# frozen_string_literal: true

class StringCalculator
  def add(num_string)
    raise ArgumentError, 'Input should be string' unless num_string.is_a?(String)

    num_string = num_string.gsub('\\n', "\n")

    return 0 if num_string.empty?

    numbers = extract_delimiters_numbers(num_string)
    validate_numbers(numbers)

    numbers&.map(&:to_i)&.sum
  end

  private

  def extract_delimiters_numbers(num_string)
    if num_string.start_with?('//')
      delimiters, numbers = num_string.split("\n", 2)
      custom_delimiter = delimiters[2..]
    else
      custom_delimiter = nil
      numbers = num_string
    end

    saparated_numbers(numbers, custom_delimiter || ',')
  end

  def saparated_numbers(numbers, delimiter)
    numbers&.split(/#{Regexp.escape(delimiter)}|,|\n/)
  end

  def validate_numbers(numbers)
    raise ArgumentError, 'Invalid input' if numbers&.any?(&:empty?)

    negative_numbers = numbers&.select { |num| num.to_i.negative? }
    raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}" if negative_numbers&.any?
  end
end
