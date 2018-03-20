a = [0]
fn = 1
i = 0
while fn <= 100
  i += 1
  a << fn
  fn = a[i] + a[i-1]
end

puts a
