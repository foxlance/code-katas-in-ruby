require "roman_numeral_converter.rb"

describe "Roman Numeral Converter" do

  before { @number = RomanNumeralsConverter.new }

  context "Converts a Hindu-Arabic integer to Roman Numeral equivalent" do
    it "Calculates the Roman Numeral for 1" do
      expect(@number.convert(1)).to eq 'I'
    end

    it "Calculates the Roman Numeral for 2" do
      expect(@number.convert(2)).to eq 'II'
    end

    it "Calculates the Roman Numeral for 4" do
      expect(@number.convert(4)).to eq 'IV'
    end

    it "Calculates the Roman Numeral for 5" do
      expect(@number.convert(5)).to eq 'V'
    end

    it "Calculates the Roman Numeral for 6" do
      expect(@number.convert(6)).to eq 'VI'
    end

    it "Calculates the Roman Numeral for 9" do
      expect(@number.convert(9)).to eq 'IX'
    end

    it "Calculates the Roman Numeral for 10" do
      expect(@number.convert(10)).to eq 'X'
    end

    it "Calculates the Roman Numeral for 11" do
      expect(@number.convert(11)).to eq 'XI'
    end

    it "Calculates the Roman Numeral for 20" do
      expect(@number.convert(20)).to eq 'XX'
    end

    it "Calculates the Roman Numeral for 44" do
      expect(@number.convert(44)).to eq 'XLIV'
    end

    it "Calculates the Roman Numeral for 50" do
      expect(@number.convert(50)).to eq 'L'
    end

    it "Calculates the Roman Numeral for 100" do
      expect(@number.convert(100)).to eq 'C'
    end

    it "Calculates the Roman Numeral for 500" do
      expect(@number.convert(500)).to eq 'D'
    end

    it "Calculates the Roman Numeral for 1000" do
      expect(@number.convert(1000)).to eq 'M'
    end

    it "Calculates the Roman Numeral for 1999" do
      expect(@number.convert(1999)).to eq 'MCMXCIX'
    end

    it "Calculates the Roman Numeral for 4990" do
      expect(@number.convert(4990)).to eq 'MMMMCMXC'
    end

    it "Raise an exception with zero" do
      expect { @number.convert(0) }.to raise_error ArgumentError
    end

    it "Raise an exception with string parameter" do
      expect { @number.convert('ten') }.to raise_error ArgumentError
    end
  end

end