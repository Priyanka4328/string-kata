require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do

    describe '.add' do

        it "returns sum of numbers" do
            result = StringCalculator.add("1, 2")
            expect(result).to eq(3)
        end
    end


end
