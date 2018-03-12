class Book < Good
  attr_accessor :genre, :author

  def self.read_from_file(file_path)
    lines = File.readlines(file_path)
    info = load_new_data(lines)
    self.new(info)
  end

  def self.load_new_data(lines)
    {:title => lines[0].chomp,
     :price => lines[1].to_i,
     :quantity => lines[2].to_i,
     :genre => lines[3].chomp,
     :author => lines[4].chomp
    }
  end

  def initialize(book)
    super
    @genre = book[:genre] || ""
    @author = book[:author] || ""
  end

  def to_s
    return "Книга #{@title}, #{@genre}, автор - #{@author}#{super}"
  end

  def update(hash)
    super

    self.author = hash[:author].chomp
    self.genre = hash[:genre].chomp
  end

  def short_info
    "Книга \"#{title}\", #{author}"
  end
end