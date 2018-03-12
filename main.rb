require_relative "lib/good"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disk"
require_relative "lib/product_collection"

collection = ProductCollection.read_folders("#{__dir__}/data")

collection.sort!(by: :price, order: :asc)

sum = 0
titles = []

puts "Добро пожаловать в магазин \"Диски, фильмы, и книги\"\n\n"
puts "Выберите товар (для выхода введите \"0\"):"

user_input = -1

until user_input == 0 || collection.products == nil

  puts collection.display

  user_input = STDIN.gets.to_i

  reply = collection.choose_product(user_input)

  if reply.is_a?(Hash)
    sum += reply[:price]
    titles << reply[:title]
  else
    puts reply
  end

  puts "Вы выбрали товаров на #{sum} руб."
end

if sum > 0
  puts 'Вы приобрели:'

  titles.each {|title| puts title}

  puts "С Вас #{sum} рублей. Спасиоб за заказ!"
else
  puts 'Жаль что вы ничего не купили. Приходите в следующий раз!'
end
