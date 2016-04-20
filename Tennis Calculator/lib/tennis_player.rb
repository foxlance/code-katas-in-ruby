class TennisPlayer

  attr_reader :score, :name

  def initialize name, score
    @name = name
    @score = score
  end

  def scores points
    @score = points
  end
end
