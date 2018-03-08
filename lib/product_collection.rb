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

    PRODUCT_TYPES.each do |type, hash|
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
      if product.quantity == 0
        puts self.products.product
      end
    end
  end
end