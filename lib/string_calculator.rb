# frozen_string_literal: true

require 'exception_handler'
class StringCalculator
    include ExceptionHandler

    INVALID_SIZE_ERROR = "numbers count should be less than 11"

    def self.add(numbers)
        numbers =  parse_numbers(numbers)
        numbers.sum
    end

    private

    def self.parse_numbers(numbers)
        numbers = numbers.split(",")
        raise ExceptionHandler::InvalidNumbersCount,  INVALID_SIZE_ERROR if numbers.size > 10
        numbers.map(&:to_i)
    end
end
