require 'rails_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'when numbers are provided' do
      it 'returns the sum of numbers' do
        expect(StringCalculator.add("")).to eq(0)
        expect(StringCalculator.add("1")).to eq(1)
        expect(StringCalculator.add("1,2")).to eq(3)
        expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
      end
    end

    context 'when numbers are provided along with new line delimiter' do
      it 'returns the sum of numbers' do
        expect(StringCalculator.add("1\n2,3,4,5")).to eq(15)
      end
    end
    context 'when big numbers > 1000 are provided' do
      it 'ignore big numbers the sum of remaining numbers' do
        expect(StringCalculator.add("1\n2,3000,4,5")).to eq(12)
      end
    end

    context 'when numbers are provided along with new delimiter mentioned in beginning' do
      it 'returns the sum of numbers' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
        expect(StringCalculator.add("//k\n4k5k6")).to eq(15)
      end
    end

    context 'when -ve numbers are provided' do
      it 'returns exception' do
        expect { StringCalculator.add("//;\n1;-2;3") }.to raise_error("negatives not allowed: -2")
        expect { StringCalculator.add("//;\n1;-2;-3") }.to raise_error("negatives not allowed: -2, -3")
      end
    end

    context 'when empty string is provided' do
      it 'returns 0' do
        expect(StringCalculator.add("")).to eq(0)
      end
    end
  end
end
