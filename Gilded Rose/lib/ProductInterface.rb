class ProductInterface
  def initialize quality, sell_in
    @quality = quality
    @sell_in = sell_in
  end

  def update
    raise NotImplementedError, 'You must implement the update() method'
  end
end