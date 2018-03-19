Shopping_cart = Hash.new

puts "Введите название товара"
name = gets.chomp
  while name.chomp != "стоп"
  puts "Введите цену за единицу товара"
  price = gets.chomp.to_f
  puts "Введите количество купленного товара"
  qty = gets.chomp.to_f
  Shopping_cart[name] = { price: price, qty: qty }
  puts "Введите название товара"
  name = gets.chomp
  end

puts "В корзине: \n"
t_sum = 0

Shopping_cart.each do |key, value|
  prod_sum = value[:price] * value[:qty]
  t_sum += prod_sum
  puts "#{key}: #{value[:qty]}, цена #{prod_sum}"
  end

puts "Хеш покупок: \n #{Shopping_cart}"

puts "Стоимость всех покупок: \n #{t_sum}"
