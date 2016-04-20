require_relative 'Normal.rb'
require_relative 'AgedBrie.rb'
require_relative 'Sulfuras.rb'
require_relative 'BackstagePasses.rb'
require_relative 'Conjured.rb'


class GildedRose

  def initialize name, quality, sell_in
    @name = name
    @quality = quality
    @sell_in = sell_in
  end

  def update
    if @name == 'normal'
      newItem = Normal.new(@quality, @sell_in)
    elsif @name == 'Aged Brie'
      newItem = AgedBrie.new(@quality, @sell_in)
    elsif @name == 'Sulfuras, Hand of Ragnaros'
      newItem = Sulfuras.new(@quality, @sell_in)
    elsif @name == 'Backstage passes to a TAFKAL80ETC concert'
      newItem = BackstagePasses.new(@quality, @sell_in)
    elsif @name == 'Conjured Mana Cake'
      newItem = Conjured.new(@quality, @sell_in)
    end

    newItem.update
    newItem
  end

end  # End of class