require_relative 'ProductInterface.rb'

class Conjured < ProductInterface

  attr_reader :quality, :sell_in

  def update
    if @quality > 0
      @quality = @quality - 2
    end
    
    @sell_in = @sell_in - 1

    if @sell_in <= 0 && @quality > 0
      @quality = @quality - 2
    end
  end
end