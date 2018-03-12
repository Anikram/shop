require_relative "lib/good"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disk"
require_relative "lib/product_collection"

collection = ProductCollection.read_folders("#{__dir__}/data")

collection.sort!(by: :price, order: :asc)

sum = 0
<<<<<<< HEAD
=======
sold_products = []
>>>>>>> issue
puts "Добро пожаловать в магазин \"Диски, фильмы, и книги\"\n\n"
puts "Выберите товар (для выхода введите \"0\"):"
user_input = -1

<<<<<<< HEAD
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
=======
until user_input == 0 || !collection.is_empty?
  puts "\nВыбрано товаров на #{sum} руб.\n"
  puts collection.display
  user_input = STDIN.gets.to_i

  reply = collection.choose_product(user_input)

  if reply.is_a?(Hash)
    sum += reply[:price]
    sold_products << reply[:title]
>>>>>>> issue
  else
    puts reply
  end
end

<<<<<<< HEAD
result = 'Жаль что вы ничего не купили. Приходите в следующий раз!'
result = "С Вас #{sum} рублей. Спасибо за заказ!" if sum > 0
puts result
=======
puts "------------"

if sum > 0
  puts "Вы приобрели:\n"

  sold = collection.checkout_list(sold_products)

  sold.each {|product| puts product}

  puts "\nС Вас #{sum} рублей. Спасиоб за заказ!"
else
  puts 'Жаль что вы ничего не купили. Приходите в следующий раз!'
end
>>>>>>> issue
