require "tennis_player.rb"
require "tennis_calculator.rb"

describe "Tennis Calculator" do

  before {
    @john = TennisPlayer.new 'John Doe', 0
    @jane = TennisPlayer.new 'Jane Doe', 0

    @game = TennisCalculator.new @john, @jane
  }

  context "Scores a game of Tennis" do
    it "Scores a scoreless game" do
      expect(@game.score).to eq 'Love-All'
    end

    it "Scores a 1-0 game" do
      @john.scores 1
      expect(@game.score).to eq 'Fifteen-Love'
    end

    it "Scores a 1-1 game" do
      @john.scores 1
      @jane.scores 1
      expect(@game.score).to eq 'Fifteen-All'
    end

    it "Scores a 2-0 game" do
      @john.scores(2);
      expect(@game.score).to eq 'Thirty-Love'
    end

    it "Scores a 2-2 game" do
      @john.scores 2
      @jane.scores 2
      expect(@game.score).to eq 'Thirty-All'
    end

    it "Scores a 3-0 game" do
      @john.scores(3);
      expect(@game.score).to eq 'Forty-Love'
    end

    it "Scores a 3-3 game" do
      @john.scores 3
      @jane.scores 3
      expect(@game.score).to eq 'Deuce'
    end

    it "Scores a 4-0 game" do
      @john.scores(4);
      expect(@game.score).to eq 'Win for John Doe'
    end

    it "Scores a 4-4 game" do
      @john.scores 4
      @jane.scores 4
      expect(@game.score).to eq 'Deuce'
    end

    it "Scores a 0-4 game" do
      @jane.scores(4);
      expect(@game.score).to eq 'Win for Jane Doe'
    end

    it "Scores a 4-2 game" do
      @john.scores(4);
      @jane.scores(2);
      expect(@game.score).to eq 'Win for John Doe'
    end

    it "Scores a 4-3 game" do
      @john.scores(4);
      @jane.scores(3);
      expect(@game.score).to eq 'Advantage John Doe'
    end

    it "Scores a 3-4 game" do
      @john.scores(3);
      @jane.scores(4);
      expect(@game.score).to eq 'Advantage Jane Doe'
    end

    it "Scores a 4-4 game" do
      @john.scores(3);
      @jane.scores(3);
      expect(@game.score).to eq 'Deuce'
    end

    it "Scores a 8-8 game" do
      @john.scores(8);
      @jane.scores(8);
      expect(@game.score).to eq 'Deuce'
    end

    it "Scores a 8-9 game" do
      @john.scores(8);
      @jane.scores(9);
      expect(@game.score).to eq 'Advantage Jane Doe'
    end

    it "Scores a 8-10 game" do
      @john.scores(8);
      @jane.scores(10);
      expect(@game.score).to eq 'Win for Jane Doe'
    end
  end
end