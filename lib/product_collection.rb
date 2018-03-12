class ProductCollection
  PRODUCT_TYPES ={
    book: {dir: 'books', class: Book},
    disk: {dir: 'disks', class: Disk},
    film: {dir: 'films', class: Film}
  }

  attr_reader :products

  # 1. прочесть все каталоги
  def self.read_folders(path)
    products = []

    PRODUCT_TYPES.each do |_type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]
      folders = Dir.glob("#{path}/#{product_dir}/*.txt")

      folders.each do |path|
        products << product_class.read_from_file(path)
      end
    end

    self.new(products)
  end

  def initialize(products)
    @products = products
  end

  def to_a
    @products
  end

  def sort!(hash)
    case hash[:by]
      when :title
        @products.sort_by! { |product| product.show}
      when :price
        @products.sort_by! { |product| product.price}
      when :quantity
        @products.sort_by! { |product| product.amount}
    end

    @products.reverse! if hash[:order] == :asc
  end

  def cleaner
    products.each do |product|
      puts self.products.product if product.quantity == 0
    end
  end

  def display
    array = ['']
    if array
      products.each_with_index {|item, index | array << "#{index + 1}. #{item}"}
      array
    else
      array = 'К сожалению товар больше нет'
    end
  end

  def choose_product(index)
    prod = products(index - 1)

    unless prod
      'Товар не найден'
    else
      reply = {title: prod.title, price: prod.price}
      prod.sell_an_item
      reply
    end
  end
end
