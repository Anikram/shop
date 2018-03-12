require_relative "lib/good"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disk"
require_relative "lib/product_collection"

collection = ProductCollection.read_folders("#{__dir__}/data")

collection.sort!(by: :price, order: :asc)

sum = 0
sold_products = []
puts "Добро пожаловать в магазин \"Диски, фильмы, и книги\"\n\n"
puts "Выберите товар (для выхода введите \"0\"):"
user_input = -1

until user_input == 0 || !collection.is_empty?
  puts "\nВыбрано товаров на #{sum} руб.\n"
  puts collection.display
  user_input = STDIN.gets.to_i

  reply = collection.choose_product(user_input)

  if reply.is_a?(Hash)
    sum += reply[:price]
    sold_products << reply[:title]
  else
    puts reply
  end
end

puts "------------"

if sum > 0
  puts "Вы приобрели:\n\n"

  sold = collection.checkout_list(sold_products)

  sold.each {|product| puts product}

  puts "\nС Вас #{sum} рублей. Спасиоб за заказ!"
else
  puts 'Жаль что вы ничего не купили. Приходите в следующий раз!'
end
