class Film < Good
  attr_writer :year, :director

  def self.read_from_file(file_path)
    lines = File.readlines(file_path)
    info = load_new_data(lines)
    self.new(info)
  end

  def self.load_new_data(lines)
    {:title => lines[0].chomp,
     :price => lines[1].to_i,
     :quantity => lines[2].to_i,
     :year => lines[3].chomp,
     :director => lines[4].chomp
    }
  end

  def initialize(film)
    super
    @year = film[:year] || ""
    @director = film[:director] || ""
  end

  def to_s
    return "Фильм #{@title}, #{@year}, реж. #{@director}#{super}"
  end

  def update(hash)
    super

    self.year = hash[:year].chomp
    self.director = hash[:director].chomp
  end
end