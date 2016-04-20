class TennisCalculator

  def initialize player1, player2
    @player1 = player1
    @player2 = player2

    @scoreTranslation = {
      0 => 'Love',
      1 => 'Fifteen',
      2 => 'Thirty',
      3 => 'Forty'
    }
  end

  def score

    if hasAWinner
      return 'Win for ' + inLead
    end

    if hasAdvantage
      return 'Advantage ' + inLead
    end

    if isDuece
      return 'Deuce'
    end

    generalScore
  end


  private

  def generalScore
    score = @scoreTranslation[@player1.score]

    if isTied
      then score + '-All'
      else score + '-' + @scoreTranslation[@player2.score]
    end
  end

  def hasAWinner
    hasEnoughPointLead && hasEnoughMinimumPoint
  end

  def hasAdvantage
    hasEnoughMinimumPoint && hashPointLead
  end

  def hasEnoughPointLead
    (@player1.score - @player2.score).abs >= 2
  end

  def hashPointLead
    (@player1.score - @player2.score).abs == 1
  end

  def hasEnoughMinimumPoint
    @player1.score >= 4 || @player2.score >= 4
  end

  def isTied
    @player1.score == @player2.score
  end

  def isDuece
    isTied && @player1.score >= 3
  end

  def inLead
    if @player1.score > @player2.score
      then @player1.name
      else @player2.name
    end
  end

end
