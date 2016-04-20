require "string_calculator.rb"

describe "String Calculator" do
  
  before { @calculator = StringCalculator.new }

  context "Calculates the total given a string of integers" do
    it "Translates an empty string into zero" do
      expect(@calculator.add('')).to eq 0
    end

    it "Finds the sum of one number" do
      expect(@calculator.add('5')).to eq 5
    end

    it "Finds the sum of two numbers" do
      expect(@calculator.add('1,2')).to eq 3
    end

    it "Finds the sum of any amount of numbers" do
      expect(@calculator.add('1,2,3,4,5')).to eq 15
    end

    it "Disallows negative numbers" do
      expect { @calculator.add('3,-2') }.to raise_error ArgumentError
    end

    it "Ignores any number that is one thousand or greater" do
      expect(@calculator.add('2, 2, 1000')).to eq 4
    end

    it "Allows for new line delimiters" do
      expect(@calculator.add("2,2\n2")).to eq 6
    end
  end
end