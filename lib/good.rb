class Good
  attr_accessor :title, :price, :quantity

  def self.read_from_file(file_path)
    return "NotImlementedError"
  end

  def self.load_new_data

  end

  def initialize(film)
    @title = film[:title] || ""
    @price = film[:price] || 0
    @quantity = film[:quantity] || 0
  end

  def to_s
    ", #{price} руб. (статок: #{quantity})"
  end

  def update(hash)
    self.title = hash[:title]
    self.price = hash[:price]
    self.quantity = hash[:quantity]
  end

  def sell_an_item
    self.quantity = self.quantity - 1
  end
end