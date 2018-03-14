puts "Введите ваше ИМЯ"
name = gets.chomp
puts "Введите ваш РОСТ";
height = gets.chomp.to_i
ideal_weight = height - 110
if ideal_weight <= 0
	puts "#{name},Ваш вес уже оптимальный"
  else
	puts "#{name}, Ваш идеальный вес #{ideal_weight}"
end
