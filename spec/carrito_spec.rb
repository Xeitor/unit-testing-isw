require 'carrito'
require 'article'

describe "Carrito" do
  before(:each) do
    @carrito = Carrito.new
    @article_with_stock = Article.new(stock: 10, product_name: "Macbook Pro 16gb")
    @article_without_stock = Article.new(stock: 0, product_name: "Macbook Pro 8gb")
  end
  # Al agregar un artículo con stock, verificar que se haya agregado a la lista.
  it 'añade_artículo_al_carrito' do
    @carrito.add_article(@article_with_stock)
    expect(@carrito.articles.size).to eql(1)
    expect(@carrito.articles.first.product_name).to eql(@article_with_stock.product_name)
  end

end