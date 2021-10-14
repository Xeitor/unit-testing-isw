# spec/string_calculator_spec.rb
require "carrito"

describe Carrito do

  def data_setup
    @carrito = Carrito.new
    @article_with_stock = Article.new
    @article_without_stock = Article.new
  end

  context "Carrito con articulos" do
    
  end
  # Al agregar un artículo con stock, verificar que se haya agregado a la lista.
  it 'añade_artículo_al_carrito' do
    @carrito.add_article(@article_with_stock)
    assert_equal @carrito.articles.size, 1
    assert_equal @carrito.articles.first.name, @article_with_stock.name
  end

end