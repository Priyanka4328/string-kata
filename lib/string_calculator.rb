# frozen_string_literal: true

require 'exception_handler'
class StringCalculator
    include ExceptionHandler

    INVALID_SIZE_ERROR = "numbers count should be less than 11"
    @@delimiter = ","

    def self.add(numbers)
        numbers = parse_and_sanitize_numbers(numbers)
        numbers.sum
    end

    private

    def self.parse_and_sanitize_numbers(numbers)
        numbers = fetch_delimiter(numbers)
        validate_numbers(numbers)
        parse_numbers(numbers)
    end

    # convert numbers string to int array to numbers
    def self.parse_numbers(numbers)
        numbers = numbers.split(/#{Regexp.escape(@@delimiter)}|\n/)
        raise ExceptionHandler::InvalidNumbersCount,  INVALID_SIZE_ERROR if numbers.size > 10
        numbers.map(&:to_i)
    end

    # Validate numbers string regexp
    def self.validate_numbers(numbers)
        return if numbers.size == 0

        negative_num_pattern = /-\d+/
        if @@delimiter != "-" && numbers.match(negative_num_pattern)
            nums = numbers.scan(negative_num_pattern).join(",")
            raise ExceptionHandler::NegativeNumbersNotAllowed, "negative numbers not allowed #{nums}"
        end

        pattern = /^\d+#{Regexp.escape(@@delimiter)}?\d+/
        unless numbers.match(pattern)
            raise ExceptionHandler::InvalidNumbersString, 'Invalid String'
        end

    end

    # Find and Set Delimiter from input string
    def  self.fetch_delimiter(numbers)
        delimiter_pattern = /\/\/.+\n/
        res = numbers.split(delimiter_pattern)
        if res.count == 2
            @@delimiter = numbers[2]
            return res[1]
        end
        numbers
    end
end
