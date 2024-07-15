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

    context 'when empty string is provided' do
      it 'returns 0' do
        expect(StringCalculator.add("")).to eq(0)
      end
    end
  end
end
