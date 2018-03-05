require_relative "lib/good"
require_relative "lib/book"
require_relative "lib/film"

current_path = File.dirname(__FILE__)

films = [
  Film.new({}),
  Film.new({})
]

films_path = current_path + "/data/films/"

films.each_with_index do |film, index|
  film.read_from_file(films_path, index)
end

books = [
  Book.new({
             :title => "Гарри Поттер и Философский камень",
             :price => 999,
             :quantity => 2,
             :genre => "Фантастика",
             :author => "Джоан К. Роулинг"
           }),
  Book.new({
             :title => "Гарри Поттер и тайная комната",
             :price => 1099,
             :quantity => 1,
             :genre => "Фантастика",
             :author => "Джоан К. Роулинг"
           })
]

books[0].genre = "Семейный"

i = 1
puts "Каталог фильмов\r\n\r\n"
films.each do |film|
  puts "#{i}. #{film.show}"
  i += 1
end
books.each do |book|
puts "#{i}. #{book.show}"
i += 1
end
