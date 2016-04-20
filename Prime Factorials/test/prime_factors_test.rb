require "minitest/autorun"
require_relative "../lib/prime_factors.rb"


class PrimeFactorTest < Minitest::Test

  def setup
    @factorial = PrimeFactorial.new
  end

  def test_calculates_that_1_does_not_have_prime_factors
    result = @factorial.generate 1
    assert_equal [], result;
  end

  def test_computes_prime_factors_of_2
    assert_equal [2], @factorial.generate(2)
  end

  def test_computes_prime_factors_of_3
    assert_equal [3], @factorial.generate(3)
  end

  def test_computes_prime_factors_of_4
    assert_equal [2,2], @factorial.generate(4)
  end

  def test_computes_prime_factors_of_5
    assert_equal [5], @factorial.generate(5)
  end

  def test_computes_prime_factors_of_6
    assert_equal [2,3], @factorial.generate(6)
  end

  def test_computes_prime_factors_of_8
    assert_equal [2, 2, 2], @factorial.generate(8)
  end

  def test_computes_prime_factors_of_9
    assert_equal [3, 3], @factorial.generate(9)
  end

  def test_computes_prime_factors_of_100
    assert_equal [2, 2, 5, 5], @factorial.generate(100)
  end

end
