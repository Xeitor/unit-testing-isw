class Article
  attr_reader :stock, :product_name
  def initialize(stock:, product_name:)
    @stock = stock
    @product_name = product_name
  end

  def check_stock_and_decrement
    if @stock > 0
      @stock -= 1
      true
    else
      false
    end
  end
end