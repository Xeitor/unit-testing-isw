# rubocop:disable
require 'carrito'
require 'article'

describe "Carrito" do
  let(:carrito) { Carrito.new }
  let(:article_with_stock) { Article.new(stock: 1000, product_name: "Macbook Pro 16gb", description: "Descripcion", price: 100) }
  let(:article_without_stock) { Article.new(stock: 0, product_name: "Macbook Pro 8gb", description: "Descripcion", price: 100) }
  let(:article_without_description) { Article.new(stock: 1000, product_name: "Macbook Pro 16gb", description: nil, price: 100) }
  let(:article_without_name) { Article.new(stock: 1000, product_name: nil, description: "Descripcion", price: 100) }
  let(:article_without_price) { Article.new(stock: 1000, product_name: "Macbook Pro 8gb", description: "Descripcion", price: nil) }

  # 1. Al agregar un artículo con stock, verificar que se haya agregado a la lista.
  it 'añade_artículo_al_carrito' do
    carrito.add_article(article_with_stock)
    expect(carrito.articles.size).to eql(1)
    expect(carrito.articles.first.product_name).to eql(article_with_stock.product_name)
  end

  # 2.  Error al intentan agregar un artículo sin descripción
  it "error_al_agregar_articulos_sin_descripcion" do
    expect { carrito.add_article(article_without_description) }.to raise_error(StandardError)
  end

  # 3. Error al intentan agregar un artículo sin nombre
  it "error_al_agregar_articulos_sin_nombre" do
    expect { carrito.add_article(article_without_name) }.to raise_error(StandardError)
  end

  # 4. Error al intentan agregar un artículo sin precio
  it "error_al_agregar_articulos_sin_descripcion" do
    expect { carrito.add_article(article_without_price) }.to raise_error(StandardError)
  end

  # 4. Error al agregar un artículo sin stock
  it "error_al_agregar_articulo_sin_stock" do
    expect { carrito.add_article(article_without_stock) }.to raise_error(StandardError)
  end
end
# rubocop:enable