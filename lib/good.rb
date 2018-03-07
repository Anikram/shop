class Good
  attr_writer :title, :price, :quantity

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

  def show

  end


end