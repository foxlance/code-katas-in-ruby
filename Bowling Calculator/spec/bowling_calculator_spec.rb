require "bowling_calculator.rb"

describe "Bowling Calculator" do

  before { @game = BowlingCalculator.new }

  context "Test calculator in various scenarios" do
    it "Scores a gutter game as zero" do
      rollTimes 20, 0
      expect(@game.score).to eq 0 
    end

    it "Scores the sum of all knocked down pins for a game" do
      rollTimes 20, 1
      expect(@game.score).to eq 20
    end

    it "Awards a one roll bonus for every spare" do
      rollSpare
      @game.roll(5);
      rollTimes(17, 0);

      expect(@game.score).to eq 20
    end

    it "Awards a two roll bonus for a strike in the previous frame" do
      rollStrike
      @game.roll 7
      @game.roll 2
      rollTimes 17, 0

      expect(@game.score).to eq 28
    end

    it "Random game with preset pins should equal to 139" do
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

      expect(@game.score).to eq 139
    end

    it "Scores a perfect game" do
      rollTimes 12, 10
      expect(@game.score).to eq 300
    end

    it "Takes exception with invalid rolls" do
      expect { @game.roll(-10) }.to raise_error(ArgumentError)
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