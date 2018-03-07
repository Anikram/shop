class Book < Good
  attr_writer :genre, :author

  def self.read_from_file(file_path)
    lines = File.readlines(file_path)
    info = load_new_data(lines)
    self.new(info)
  end

  def self.load_new_data(lines)
    {:title => lines[0].chomp,
     :price => lines[1].chomp,
     :quantity => lines[2].chomp,
     :genre => lines[3].chomp,
     :author => lines[4].chomp
    }
  end

  def initialize(book)
    super
    @genre = book[:genre] || ""
    @author = book[:author] || ""
  end

  def show
    return "Книга #{@title}, #{@genre}, автор - #{@author}, #{@price} руб. (осталось #{@quantity})"
  end
end