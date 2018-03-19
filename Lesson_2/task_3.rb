a = []
a[0] = 1
a[1] = 1
i = 1
while i < 100
  a[i+1] = a[i] + a[i-1]
  i += 1
end

puts a
