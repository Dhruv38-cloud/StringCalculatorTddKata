# StringCalculator

StringCalculator is a Ruby library that performs calculations on strings containing numbers. It supports various delimiters, custom delimiters, and handles invalid input gracefully.

## Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/Dhruv38-cloud/StringCalculatorTddKata.git

```

## ruby version

ruby-3.3.0

## Setup
#### Install dependencies
```
bundle install
```

#### To run test cases
```
rspec
```

# Run the application

#### Input : Empty string
```
ruby main.rb ""
Calculating for: 
Result: 0
```

#### Input : Single number
``` 
ruby main.rb "1"
Calculating for: 1
Result: 1
```

#### Input : Multiple numbers
``` 
ruby main.rb "1,2,3"
Calculating for: 1,2,3
Result: 6
```

#### Input : Newline separated numbers
``` 
ruby main.rb "1\n2\n3"
Calculating for: 1,2,3
Result: 6
```

#### Input : Custom delimiter with string
``` 
ruby main.rb "//;\n1;2;3"
Calculating for: 1,2,3
Result: 6
```
