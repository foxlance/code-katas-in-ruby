require 'minitest/autorun'
require_relative '../lib/GildedRose.rb'

class GildedRoseTest < Minitest::Test

  # Test for Normal Products/Items

  def test_updates_normal_items_before_sell_date
    item = GildedRose.new('normal', 10, 5).update
    assert_equal 9, item.quality
    assert_equal 4, item.sell_in
  end

  def test_updates_normal_items_on_the_sell_date
    item = GildedRose.new('normal', 10, 0).update
    assert_equal 8, item.quality
    assert_equal -1, item.sell_in
  end

  def test_updates_normal_items_after_the_sell_date
    item = GildedRose.new('normal', 10, -5).update
    assert_equal 8, item.quality
    assert_equal -6, item.sell_in
  end

  def test_updates_normal_items_with_a_quality_of_0
    item = GildedRose.new('normal', 0, 5).update
    assert_equal 0, item.quality
    assert_equal 4, item.sell_in
  end



  # Brie Items

  def test_updates_Brie_items_before_the_sell_date
    item = GildedRose.new('Aged Brie', 10, 5).update
    assert_equal 11, item.quality
    assert_equal 4, item.sell_in
  end

  def test_updates_Brie_items_before_the_sell_date_with_maximum_quality
    item = GildedRose.new('Aged Brie', 50, 5).update
    assert_equal 50, item.quality
    assert_equal 4, item.sell_in
  end

  def test_updates_Brie_items_on_the_sell_date
    item = GildedRose.new('Aged Brie', 10, 0).update
    assert_equal 12, item.quality
    assert_equal -1, item.sell_in
  end

  def test_updates_Brie_items_on_the_sell_date_near_maximum_quality
    item = GildedRose.new('Aged Brie', 49, 0).update
    assert_equal 50, item.quality
    assert_equal -1, item.sell_in
  end

  def test_updates_Brie_items_on_the_sell_date_with_maximum_quality
    item = GildedRose.new('Aged Brie', 50, 0).update
    assert_equal 50, item.quality
    assert_equal -1, item.sell_in
  end

  def test_updates_Brie_items_after_the_sell_date
    item = GildedRose.new('Aged Brie', 10, -10).update
    assert_equal 12, item.quality
    assert_equal -11, item.sell_in
  end

  def test_updates_Briem_items_after_the_sell_date_with_maximum_quality
    item = GildedRose.new('Aged Brie', 50, -10).update
    assert_equal 50, item.quality
    assert_equal -11, item.sell_in
  end



  # Sulfuras Items
  
  def test_updates_Sulfuras_items_before_the_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 10, 5).update
    assert_equal 10, item.quality
    assert_equal 5, item.sell_in
  end
  
  def test_updates_Sulfuras_items_on_the_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 10, 5).update
    assert_equal 10, item.quality
    assert_equal 5, item.sell_in
  end
  
  def test_updates_Sulfuras_items_after_the_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 10, -1).update
    assert_equal 10, item.quality
    assert_equal -1, item.sell_in
  end



  # Backstage Passes
  
  def test_updates_Backstage_pass_items_long_before_the_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 11).update
    assert_equal 11, item.quality
    assert_equal 10, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_close_to_the_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 10).update
    assert_equal 12, item.quality
    assert_equal 9, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_close_to_the_sell_data_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 10).update
    assert_equal 50, item.quality
    assert_equal 9, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_very_close_to_the_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 5).update
    assert_equal 13, item.quality
    assert_equal 4, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_very_close_to_the_sell_date_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 5).update
    assert_equal 50, item.quality
    assert_equal 4, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_with_one_day_left_to_sell
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 1).update
    assert_equal 13, item.quality
    assert_equal 0, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_with_one_day_left_to_sell_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 1).update
    assert_equal 50, item.quality
    assert_equal 0, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_on_the_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 0).update
    assert_equal 0, item.quality
    assert_equal -1, item.sell_in
  end
  
  def test_updates_Backstage_pass_items_after_the_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, -1).update
    assert_equal 0, item.quality
    assert_equal -2, item.sell_in
  end



  # Conjured Items
  
  def test_updates_Conjured_items_before_the_sell_date
    item = GildedRose.new('Conjured Mana Cake', 10, 10).update
    assert_equal 8, item.quality
    assert_equal 9, item.sell_in
  end
  
  def test_updates_Conjured_items_at_zero_quality
    item = GildedRose.new('Conjured Mana Cake', 0, 10).update
    assert_equal 0, item.quality
    assert_equal 9, item.sell_in
  end
  
  def test_updates_Conjured_items_on_the_sell_date
    item = GildedRose.new('Conjured Mana Cake', 10, 0).update
    assert_equal 6, item.quality
    assert_equal -1, item.sell_in
  end
  
  def test_updates_Conjured_items_on_the_sell_date_at_0_quality
    item = GildedRose.new('Conjured Mana Cake', 0, 0).update
    assert_equal 0, item.quality
    assert_equal -1, item.sell_in
  end
  
  def test_updates_Conjured_items_after_the_sell_date
    item = GildedRose.new('Conjured Mana Cake', 10, -10).update
    assert_equal 6, item.quality
    assert_equal -11, item.sell_in
  end
  
  def test_updates_Conjured_items_after_the_sell_date_at_zero_quality
    item = GildedRose.new('Conjured Mana Cake', 0, -10).update
    assert_equal 0, item.quality
    assert_equal -11, item.sell_in
  end
  
end