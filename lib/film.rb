class Film < Good
  attr_writer :year, :director

  def initialize(film)
    super
    @year = film[:year] || ""
    @director = film[:director] || ""
  end

  def show
    return "Фильм #{@title}, #{@year}, реж. #{@director}, #{@price} руб. (осталось #{@quantity})"
  end

  def read_from_file(file_path, index = 1)
      path = "#{file_path}#{index}.txt"
      f = File.new(path,"r:UTF-8")
      lines = f.readlines
      f.close
      load_new_data(lines)
  end

  def load_new_data(lines)
      self.title = lines[0].chomp
      self.price = lines[1].chomp
      self.quantity = lines[2].chomp
      self.year = lines[3].chomp
      self.director = lines[4].chomp
  end
end