require_relative 'ProductInterface.rb'

class AgedBrie < ProductInterface

  attr_reader :quality, :sell_in

  def update
    if @quality < 50
      @quality = @quality + 1
    end
    
    @sell_in = @sell_in - 1

    if @sell_in <= 0 && @quality < 50
      @quality = @quality + 1
    end
  end
end