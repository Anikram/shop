require_relative "lib/good"
require_relative "lib/book"
require_relative "lib/film"

film_paths = Dir.glob("#{__dir__}/data/films/*")
book_paths = Dir.glob("#{__dir__}/data/books/*")

films =[]
books = []

film_paths.each do |path|
  films << Film.read_from_file(path)
end

book_paths.each do |path|
  books << Book.read_from_file(path)
end

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
