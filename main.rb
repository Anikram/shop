require_relative "lib/good"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disk"
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

collection.sort!(by: :price, order: :asc)

input = -1
sum = 0

puts "Добро пожаловать в магазин \"Диски, фильмы, и книги\"\n\n"

until input == 0
  correct_choices = [0]

  puts "Выберите товар: (для завершения выберите \"0\") \n"

   collection.to_a.each_with_index do |product, index|
     puts "#{index + 1}. #{product.to_s}"
     correct_choices << index + 1
   end

  puts "0. Выход"

  input = STDIN.gets.to_i

  if input == 0
    break
  elsif correct_choices.include?(input)
    sum += collection.to_a[input - 1].price.to_i

    collection.to_a[input - 1].sell_an_item

    puts "Вы выбрали на #{sum} рублей"

    collection.to_a.delete_at(input - 1) if collection.to_a[input - 1].quantity == 0
  else
    puts 'Вы ввели не корректный номер товара'
  end
end

result = 'Жаль что вы ничего не купили. Приходите в следующий раз!'

result = "С Вас #{sum} рублей. Спасибо за заказ!" if sum > 0

puts result








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
