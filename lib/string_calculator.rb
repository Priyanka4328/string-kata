class StringCalculator

    def self.add(numbers)
        numbers =  parse_numbers(numbers)
        numbers.sum
    end

    private

    def self.parse_numbers(numbers)
        numbers = numbers.split(",")
        numbers.map(&:to_i)
    end
end
