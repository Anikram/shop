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
    products.each_with_index do |product, index|
      if product.quantity <= 0
        self.products.delete_at(index)
      end
    end
  end

  def display
    array = ['']
    index = 1
    if array
      products.each do |item|
        array << "#{index}. #{item}"
        index += 1
      end
      array
    else
      array = 'К сожалению товара больше нет'
    end
  end

  def choose_product(var)
    return if var == 0

    prod = self.products[var - 1]

    if prod
      reply = {title: prod , price: prod.price}
      prod.sell_an_item

      cleaner

      reply
    else
      'Товар не найден'
    end
  end

  def is_empty?
    products.any?
  end

  def checkout_list(prods)
    sorted_prods = []
    prods.each do |prod|
      unless sorted_prods.include?(prod)
        sorted_prods << prod
      end
    end

    how_many_sold(sorted_prods)
  end

  def how_many_sold(prods)
    result = []
    prods.each do |prod|
      result << "#{prod.short_info} - #{prod.sold} шт."
    end
    result
  end
end
