class Carrito
  attr_reader :articles
  def initialize
    @articles = []
  end

  def add_article(article)
    check_stock = article.check_stock_and_decrement
    if !check_stock
      raise StandardError, "Artículo sin stock"
    end
    @articles.push(article)
  end
end
