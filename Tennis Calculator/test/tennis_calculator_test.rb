require "minitest/autorun"
require_relative "../lib/tennis_player.rb"
require_relative "../lib/tennis_calculator.rb"


class TennisCalculatorTest < Minitest::Test

  def setup
    @john = TennisPlayer.new 'John Doe', 0
    @jane = TennisPlayer.new 'Jane Doe', 0

    @game = TennisCalculator.new @john, @jane
  end

  def test_scores_a_scoreless_game
    assert_equal 'Love-All', @game.score
  end

  def test_scores_a_1_0_game
    @john.scores 1
    assert_equal 'Fifteen-Love', @game.score
  end

  def test_scores_a_1_1_game
    @john.scores 1
    @jane.scores 1
    assert_equal 'Fifteen-All', @game.score
  end

  def test_scores_a_2_0_game
    @john.scores(2);
    assert_equal 'Thirty-Love', @game.score
  end

  def test_scores_a_2_2_game
    @john.scores 2
    @jane.scores 2
    assert_equal 'Thirty-All', @game.score
  end

  def test_scores_a_3_0_game
    @john.scores(3);
    assert_equal 'Forty-Love', @game.score
  end

  def test_scores_a_3_3_game
    @john.scores 3
    @jane.scores 3
    assert_equal 'Deuce', @game.score
  end

  def test_scores_a_4_0_game
    @john.scores(4);
    assert_equal 'Win for John Doe', @game.score
  end

  def test_scores_a_4_4_game
    @john.scores 4
    @jane.scores 4
    assert_equal 'Deuce', @game.score
  end

  def test_scores_a_0_4_game
    @jane.scores(4);
    assert_equal 'Win for Jane Doe', @game.score
  end

  def test_scores_a_4_2_game
    @john.scores(4);
    @jane.scores(2);
    assert_equal 'Win for John Doe', @game.score
  end

  def test_scores_a_4_3_game
    @john.scores(4);
    @jane.scores(3);
    assert_equal 'Advantage John Doe', @game.score
  end

  def test_scores_a_3_4_game
    @john.scores(3);
    @jane.scores(4);
    assert_equal 'Advantage Jane Doe', @game.score
  end

  def test_scores_a_4_4_game
    @john.scores(3);
    @jane.scores(3);
    assert_equal 'Deuce', @game.score
  end

  def test_scores_a_8_8_game
    @john.scores(8);
    @jane.scores(8);
    assert_equal 'Deuce', @game.score
  end

  def test_scores_a_8_9_game
    @john.scores(8);
    @jane.scores(9);
    assert_equal 'Advantage Jane Doe', @game.score
  end

  def test_scores_a_8_10_game
    @john.scores(8);
    @jane.scores(10);
    assert_equal 'Win for Jane Doe', @game.score
  end


end
