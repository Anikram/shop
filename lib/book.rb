class Book < Good
  attr_writer :genre, :author

  def initialize(book)
    super
    @genre = book[:genre] || ""
    @author = book[:author] || ""
  end

  def show
    return "Книга #{@title}, #{@genre}, автор - #{@author}, #{@price} руб. (осталось #{@quantity})"
  end
end