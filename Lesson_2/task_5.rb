Months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

puts "Веедите число"
date = gets.chomp.to_i
puts "Веедите месяц"
month = gets.chomp.to_i
puts "Веедите год"
year = gets.chomp.to_i

qty = 0

if (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)
  then
    Months[1] += 1
    puts "Год високосный!"
  else
    puts "Год не високосный!"
end

(0..month-1).each  { |i| qty += Months[i] }

puts "Количество дней c начала года #{qty + date}"
