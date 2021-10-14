require 'carrito'
require 'article'

describe "Carrito" do
  let(:carrito) { Carrito.new }
  let(:article_with_stock) { Article.new(stock: 1000, product_name: "Macbook Pro 16gb", description: "Descripcion", price: 100) }
  let(:article_without_stock) { Article.new(stock: 0, product_name: "Macbook Pro 8gb", description: "Descripcion", price: 100) }
  let(:article_without_description) { Article.new(stock: 1000, product_name: "Macbook Pro 16gb", description: nil, price: 100) }

  # 1. Al agregar un artículo con stock, verificar que se haya agregado a la lista.
  it 'añade_artículo_al_carrito' do
    carrito.add_article(article_with_stock)
    expect(carrito.articles.size).to eql(1)
    expect(carrito.articles.first.product_name).to eql(article_with_stock.product_name)
  end

  # 2. Que todos los artículos de un carrito tengan la siguiente información: nombre, descripción y precio.
  it 'chequear_que_los_articulos_de_un_carrito_tengan_información_completa' do
    for i in 1..10
      carrito.add_article(article_with_stock)
    end
    carrito.articles.each do |article|
      expect(article.product_name).not_to be(nil)
      expect(article.description).not_to be(nil)
      expect(article.price).not_to be(nil)
    end
  end

  # 3. Si se intenta agregar un producto al catálogo sin nombre y/o descripción debe salir un error.
  it "error_al_agregar_articulos_sin_descripcion" do
    expect { carrito.add_article(article_without_description) }.to raise_error(StandardError)
  end

  # 4. Error al agregar un artículo sin stock
  it "error_al_agregar_articulo_sin_stock" do
    expect { carrito.add_article(article_without_stock) }.to raise_error(StandardError)
  end
end
