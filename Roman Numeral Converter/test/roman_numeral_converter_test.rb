require "minitest/autorun"
require_relative "../lib/roman_numeral_converter.rb"

class Roman_Numeral_Converter_Test < Minitest::Test

  def setup
    @number = RomanNumeralsConverter.new
  end


  def test_calculates_the_roman_numeral_for_1
    assert_equal 'I', @number.convert(1)
  end

  def test_calculates_the_roman_numeral_for_2
    assert_equal 'II', @number.convert(2)
  end

  def test_calculates_the_roman_numeral_for_4
    assert_equal 'IV', @number.convert(4)
  end

  def test_calculates_the_roman_numeral_for_5
    assert_equal 'V', @number.convert(5)
  end

  def test_calculates_the_roman_numeral_for_6
    assert_equal 'VI', @number.convert(6)
  end

  def test_calculates_the_roman_numeral_for_9
    assert_equal 'IX', @number.convert(9)
  end

  def test_calculates_the_roman_numeral_for_10
    assert_equal 'X', @number.convert(10)
  end

  def test_calculates_the_roman_numeral_for_11
    assert_equal 'XI', @number.convert(11)
  end

  def test_calculates_the_roman_numeral_for_20
    assert_equal 'XX', @number.convert(20)
  end

  def test_calculates_the_roman_numeral_for_44
    assert_equal 'XLIV', @number.convert(44)
  end

  def test_calculates_the_roman_numeral_for_50
    assert_equal 'L', @number.convert(50)
  end

  def test_calculates_the_roman_numeral_for_100
    assert_equal 'C', @number.convert(100)
  end

  def test_calculates_the_roman_numeral_for_500
    assert_equal 'D', @number.convert(500)
  end

  def test_calculates_the_roman_numeral_for_1000
    assert_equal 'M', @number.convert(1000)
  end

  def test_calculates_the_roman_numeral_for_1999
    assert_equal 'MCMXCIX', @number.convert(1999)
  end

  def test_calculates_the_roman_numeral_for_4990
    assert_equal 'MMMMCMXC', @number.convert(4990)
  end

  def test_raise_an_exception_with_zero
    assert_raises ArgumentError do
      @number.convert(0)
    end
  end

  def test_raise_an_exception_with_string_parameter
    assert_raises ArgumentError do
      @number.convert('ten')
    end
  end

end
