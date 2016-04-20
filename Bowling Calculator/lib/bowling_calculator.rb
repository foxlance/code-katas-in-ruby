class BowlingCalculator

  def initialize
    @frames = 10
    @scores = []
  end

  def roll pins
    catchInvalidPin pins
    @scores << pins
  end

  def score
    roll = 0
    total = 0

    (0...@frames).each do
      if isStrike roll
        total += strikeScore roll
        roll += 1
      elsif isSpare roll
        total += spareScore roll
        roll += 2
      else
        total += normalScore roll
        roll += 2
      end
    end

    total
  end


  private

  def isStrike roll
    @scores[roll] == 10
  end

  def isSpare roll
    (@scores[roll]+@scores[roll+1]) == 10
  end

  def strikeScore roll
    10 + @scores[roll+1] + @scores[roll+2]
  end

  def spareScore roll
    10 + @scores[roll+2]
  end

  def normalScore roll
    @scores[roll]+@scores[roll+1]
  end

  def catchInvalidPin pins
    if !pins.is_a?(Fixnum)
      raise ArgumentError, "Invalid pin count provided: #{pins}"
    end
    if pins < 0
      raise ArgumentError, "Pin cannot be lower than zero: #{pins}"
    end
  end

end
