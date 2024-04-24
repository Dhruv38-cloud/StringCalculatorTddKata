# frozen_string_literal: true

require_relative 'lib/string_calculator'

if ARGV.length.positive?
  input = ARGV[0]
  puts "Calculating for: #{input}"

  begin
    string_calculator = StringCalculator.new
    result = string_calculator.add(input)
    puts "Result: #{result}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
else
  puts 'Error: No input provided.'
end
