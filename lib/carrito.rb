class Carrito
  attr_reader :articles
  def initialize
    @articles = []
  end

  def add_article(article)
    check_stock = article.check_stock_and_decrement
    raise StandardError, "Error al agregar artículo, no tiene stock" if !check_stock
    raise StandardError, "Error al agregar artículo, no tiene nombre" if article.product_name.nil?
    raise StandardError, "Error al agregar artículo, no tiene descripcion" if article.description.nil?
    raise StandardError, "Error al agregar artículo, no tiene precio" if article.price.nil?
    @articles.push(article)
  end
end
