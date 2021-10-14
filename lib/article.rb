class Article
  attr_reader :stock, :product_name, :description, :price
  def initialize(stock:, product_name:, description:, price:)
    @stock        = stock
    @product_name = product_name
    @description  = description
    @price        = price
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