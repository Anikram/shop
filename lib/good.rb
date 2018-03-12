class Good
  attr_accessor :title, :price, :quantity, :sold

  def self.read_from_file(file_path)
    return "NotImlementedError"
  end

  def self.load_new_data

  end

  def initialize(hash)
    @title = hash[:title] || ""
    @price = hash[:price] || 0
    @quantity = hash[:quantity] || 0
    @sold = 0
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
    self.sold += 1
  end

  def is_empty?
    if quantity <= 0
      true
    else
      false
    end
  end

  def short_info

  end
end