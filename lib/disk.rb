class Disk < Good
  attr_accessor :genre, :year, :author

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
     :author => lines[4].chomp,
     :genre => lines[4].chomp
    }
  end

  def initialize(film)
    super
    @year = film[:year] || ""
    @author = film[:author] || ""
    @genre = film[:genre] || ""
  end

  def to_s
    return "Альбом #{title} - Исполнитель: #{author}, #{year} год#{super}"
  end

  def update(hash)
    super

    self.year = hash[:year].chomp
    self.author = hash[:author].chomp
    self.genre = hash[:genre].chomp
  end
end