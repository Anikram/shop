class Film < Good
  attr_writer :year, :director

  def self.read_from_file(file_path)
    lines = File.readlines(file_path)
    info = load_new_data(lines)
    self.new(info)
  end

  def self.load_new_data(lines)
    {:title => lines[0].chomp,
     :price => lines[1].chomp,
     :quantity => lines[2].chomp,
     :year => lines[3].chomp,
     :director => lines[4].chomp
    }
  end

  def initialize(film)
    super
    @year = film[:year] || ""
    @director = film[:director] || ""
  end

  def show
    return "Фильм #{@title}, #{@year}, реж. #{@director}, #{@price} руб. (осталось #{@quantity})"
  end

  def manual_loading(lines)
    self.title = lines[0].chomp
    self.price = lines[1].chomp
    self.quantity = lines[2].chomp
    self.year = lines[3].chomp
    self.director = lines[4].chomp
  end
end