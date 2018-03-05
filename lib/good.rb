class Good
  attr_writer :title, :price, :quantity

  def initialize(film)
    @title = film[:title] || ""
    @price = film[:price] || 0
    @quantity = film[:quantity] || 0
  end

  def show

  end

  def read_from_file

  end
end