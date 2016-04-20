require "minitest/autorun"
require_relative "../lib/string_calculator.rb"

class StringCalculatorTest < Minitest::Test

  def setup
    @calculator = StringCalculator.new
  end

  def test_translates_an_empty_string_into_zero
    assert_equal 0, @calculator.add('')
  end

  def test_finds_the_sum_of_one_number
    assert_equal 5, @calculator.add('5')
  end

  def test_finds_the_sum_of_two_numbers
    assert_equal 3, @calculator.add('1,2')
  end

  def test_finds_the_sum_of_any_amount_of_numbers
    assert_equal 15, @calculator.add('1,2,3,4,5')
  end

  def test_disallows_negative_numbers
    assert_raises ArgumentError do
      @calculator.add('3,-2')
    end
  end

  def test_ignores_any_number_that_is_one_thousand_or_greater
    assert_equal 4, @calculator.add('2, 2, 1000')
  end

  def test_allows_for_new_line_delimiters
    assert_equal 6, @calculator.add("2,2\n2")
  end

end
