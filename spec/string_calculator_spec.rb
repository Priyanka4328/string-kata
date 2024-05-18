require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do

    describe '.add' do

        it "returns sum of numbers" do
            result = StringCalculator.add("1,2")
            expect(result).to eq(3)
        end

        context "size of input string" do

            it "returns 0 when empty string passed as input" do
                result = StringCalculator.add("")
                expect(result).to eq(0)
            end

            it "returns excpetion when size of input string exceedes 10" do
                input  = "0"
                11.times do |i|
                    input = input + ", " + (i+1).to_s
                end
                expect{ StringCalculator.add(input) }.to raise_error(ExceptionHandler::InvalidNumbersCount)
            end
        end


        context "support \n in string" do

            it "returns sum for valid string like '1\n2,3' " do
                result = StringCalculator.add("1\n2,3")
                expect(result).to eq(6)
            end
        end

        context "Validate input string" do

            it "returns sum for valid string like '1\n2,3' " do
                result = StringCalculator.add("1\n2,3")
                expect(result).to eq(6)
            end

            it "returns error for invalid string 1,\n" do
                expect{ StringCalculator.add("1,\n") }.to raise_error(ExceptionHandler::InvalidNumbersString)
            end


            it "returns error for invalid string ,1\n" do
                expect{ StringCalculator.add(",1\n") }.to raise_error(ExceptionHandler::InvalidNumbersString)
            end

            it "returns error for invalid string 1,,1\n" do
                expect{ StringCalculator.add("1,,1\n") }.to raise_error(ExceptionHandler::InvalidNumbersString)
            end
        end


        context "Support different delimiters" do

            it "returns sum for $ as delimiter for numbers in string" do
                result = StringCalculator.add("//$\n1$2")
                expect(result).to eq(3)
            end

            it "returns sum for % as delimiter for numbers in string" do
                result = StringCalculator.add("//%\n1%2")
                expect(result).to eq(3)
            end
        end


        context "Should return error for invalid delimiter" do

            it "returns exception for invalid string" do
                expect { StringCalculator.add("//$\n1,2") }.to raise_error(ExceptionHandler::InvalidNumbersString)
            end

        end
    end


end
