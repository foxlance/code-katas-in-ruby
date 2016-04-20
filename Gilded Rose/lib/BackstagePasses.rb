require_relative 'ProductInterface.rb'

class BackstagePasses < ProductInterface

  attr_reader :quality, :sell_in

  def update
    @sell_in = @sell_in - 1

    if @sell_in < 5
      @quality = @quality + 3
    elsif @sell_in < 10
      @quality = @quality + 2
    else
      @quality = @quality + 1
    end

    if @quality > 50
      @quality = 50;
    end

    if @sell_in < 0
      @quality = 0;
    end
  end
end