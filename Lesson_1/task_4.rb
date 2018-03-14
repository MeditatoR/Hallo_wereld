puts "Введите 3 коэффицента"
a = gets.to_f
b = gets.to_f
c = gets.to_f

d = b**2 - 4 * a * c

x1 = (-b + Math.sqrt(d)) / (2 * a)
x2 = (-b - Math.sqrt(d)) / (2 * a)
puts "Дискриминант = #{d}"

if d > 0
	puts "x1 = #{x1}"
	puts "x2 = #{x2}"
  elsif d == 0
	puts "x = #{(-b / (2 * a))}"
  else
	puts "Корней нет"
end
