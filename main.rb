require_relative "lib/good"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/product_collection"


# film_paths = Dir.glob("#{__dir__}/data/films/*")
# book_paths = Dir.glob("#{__dir__}/data/books/*")
#
# films =[]
# books = []
#
# film_paths.each do |path|
#   films << Film.read_from_file(path)
# end
#
# book_paths.each do |path|
#   books << Book.read_from_file(path)
# end
#
#
collection = ProductCollection.read_folders("#{__dir__}/data")

collection.sort!(by: :price, order: :dsc)

result = collection.to_a


result.each_with_index do |product, index|
  puts "#{index + 1}. #{product.show}"
end


# i = 1
#
# puts "Каталог фильмов\r\n\r\n"
#
# films.each do |film|
#   puts "#{i}. #{film.show}"
#   i += 1
# end
#
# books.each do |book|
# puts "#{i}. #{book.show}"
# i += 1
# end
