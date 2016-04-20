require "minitest/autorun"
require_relative "../lib/bowling_calculator.rb"

class BowlingCalculatorTest < Minitest::Test

  def setup
    @game = BowlingCalculator.new
  end

  def test_scores_a_gutter_game_as_zero
    rollTimes 20, 0
    assert_equal 0, @game.score
  end

  def test_scores_the_sum_of_all_knocked_down_pins_for_a_game
    rollTimes 20, 1
    assert_equal 20, @game.score
  end

  def test_awards_a_one_roll_bonus_for_every_spare
    rollSpare
    @game.roll(5);
    rollTimes(17, 0);

    assert_equal 20, @game.score
  end

  def test_awards_a_two_roll_bonus_for_a_strike_in_the_previous_frame
    rollStrike
    @game.roll 7
    @game.roll 2
    rollTimes 17, 0

    assert_equal 28, @game.score
  end

  def test_random_game_with_preset_pins_should_equal_to_139
    @game.roll 8
    @game.roll 1
    @game.roll 8
    @game.roll 2
    @game.roll 7
    @game.roll 2
    @game.roll 10
    @game.roll 8
    @game.roll 2
    @game.roll 9
    @game.roll 0
    @game.roll 2
    @game.roll 7
    @game.roll 9
    @game.roll 1
    @game.roll 8
    @game.roll 1
    @game.roll 10
    @game.roll 3
    @game.roll 7

    assert_equal 139, @game.score
  end

  def test_scores_a_perfect_game
    rollTimes 12, 10
    assert_equal 300, @game.score
  end

  def test_takes_exception_with_invalid_rolls
    assert_raises ArgumentError do
      @game.roll(-10)
    end
  end


  private

  def rollTimes repeat, pins
    (0...repeat).each do
      @game.roll pins
    end
  end

  def rollSpare
    @game.roll(2);
    @game.roll(8);
  end

  def rollStrike
    @game.roll(10);
  end

end
