require "GildedRose.rb"

describe "Gilded Rose" do
  
  context "Test Normal Items" do
    it "Updates normally before sell date" do
      item = GildedRose.new('normal', 10, 5).update
      expect(item.quality).to eq 9
      expect(item.sell_in).to eq 4
    end

    it "Updates items on the sell date" do
      item = GildedRose.new('normal', 10, 0).update
      expect(item.quality).to eq 8
      expect(item.sell_in).to eq -1
    end

    it "Updates items after the sell date" do
      item = GildedRose.new('normal', 10, -5).update
      expect(item.quality).to eq 8
      expect(item.sell_in).to eq -6
    end

    it "Updates items with a quality of 0" do
      item = GildedRose.new('normal', 0, 5).update
      expect(item.quality).to eq 0
      expect(item.sell_in).to eq 4
    end
  end


  context "Test Aged Brie" do
    it "Updates items before the sell date" do
      item = GildedRose.new('Aged Brie', 10, 5).update
      expect(item.quality).to eq 11
      expect(item.sell_in).to eq 4
    end

    it "Updates items before the sell date with maximum quality" do
      item = GildedRose.new('Aged Brie', 50, 5).update
      expect(item.quality).to eq 50
      expect(item.sell_in).to eq 4
    end

    it "Updates items on the sell date" do
      item = GildedRose.new('Aged Brie', 10, 0).update
      expect(item.quality).to eq 12
      expect(item.sell_in).to eq -1
    end

    it "Updates items on the sell date near maximum quality" do
      item = GildedRose.new('Aged Brie', 49, 0).update
      expect(item.quality).to eq 50
      expect(item.sell_in).to eq -1
    end

    it "Updates items on the sell date with maximum quality" do
      item = GildedRose.new('Aged Brie', 50, 0).update
      expect(item.quality).to eq 50
      expect(item.sell_in).to eq -1
    end

    it "Updates items after the sell date" do
      item = GildedRose.new('Aged Brie', 10, -10).update
      expect(item.quality).to eq 12
      expect(item.sell_in).to eq -11
    end

    it "Updates items after the sell date with maximum quality" do
      item = GildedRose.new('Aged Brie', 50, -10).update
      expect(item.quality).to eq 50
      expect(item.sell_in).to eq -11
    end
  end


  context "Test Sulfuras, Hand of Ragnaros" do
    it "Updates items before the sell date" do
      item = GildedRose.new('Sulfuras, Hand of Ragnaros', 10, 5).update
      expect(item.quality).to eq 10
      expect(item.sell_in).to eq 5
    end

    it "Updates items on the sell date" do
      item = GildedRose.new('Sulfuras, Hand of Ragnaros', 10, 5).update
      expect(item.quality).to eq 10
      expect(item.sell_in).to eq 5
    end

    it "Updates items after the sell date" do
      item = GildedRose.new('Sulfuras, Hand of Ragnaros', 10, -1).update
      expect(item.quality).to eq 10
      expect(item.sell_in).to eq -1
    end
  end


  context "Test Backstage passes to a TAFKAL80ETC concert" do
    it "Updates items long before the sell date" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 11).update
      expect(item.quality).to eq 11
      expect(item.sell_in).to eq 10
    end

    it "Updates items close to the sell date" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 10).update
      expect(item.quality).to eq 12
      expect(item.sell_in).to eq 9
    end

    it "Updates items close to the sell data at max quality" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 10).update
      expect(item.quality).to eq 50
      expect(item.sell_in).to eq 9
    end

    it "Updates items very close to the sell date" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 5).update
      expect(item.quality).to eq 13
      expect(item.sell_in).to eq 4
    end

    it "Updates items very close to the sell date at max_quality" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 5).update
      expect(item.quality).to eq 50
      expect(item.sell_in).to eq 4
    end

    it "Updates items with one day left to sell" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 1).update
      expect(item.quality).to eq 13
      expect(item.sell_in).to eq 0
    end

    it "Updates items with one day left to sell at max quality" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 1).update
      expect(item.quality).to eq 50
      expect(item.sell_in).to eq 0
    end

    it "Updates items on the sell date" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 0).update
      expect(item.quality).to eq 0
      expect(item.sell_in).to eq -1
    end

    it "Updates items after the sell date" do
      item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, -1).update
      expect(item.quality).to eq 0
      expect(item.sell_in).to eq -2
    end
  end


  context "Test Conjured Mana Cake" do
    it "Updates items before the sell date" do
      item = GildedRose.new('Conjured Mana Cake', 10, 10).update
      expect(item.quality).to eq 8
      expect(item.sell_in).to eq 9
    end

    it "Updates items at zero quality" do
      item = GildedRose.new('Conjured Mana Cake', 0, 10).update
      expect(item.quality).to eq 0
      expect(item.sell_in).to eq 9
    end

    it "Updates items on the sell date" do
      item = GildedRose.new('Conjured Mana Cake', 10, 0).update
      expect(item.quality).to eq 6
      expect(item.sell_in).to eq -1
    end

    it "Updates items on the sell date at 0 quality" do
      item = GildedRose.new('Conjured Mana Cake', 0, 0).update
      expect(item.quality).to eq 0
      expect(item.sell_in).to eq -1
    end

    it "Updates items after the sell date" do
      item = GildedRose.new('Conjured Mana Cake', 10, -10).update
      expect(item.quality).to eq 6
      expect(item.sell_in).to eq -11
    end

    it "Updates items after the sell date at zero quality" do
      item = GildedRose.new('Conjured Mana Cake', 0, -10).update
      expect(item.quality).to eq 0
      expect(item.sell_in).to eq -11
    end
  end

end