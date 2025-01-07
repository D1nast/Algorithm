n = gets.to_i

numbers = [*1..n]
ans = []

numbers.each do |num|
  count = 0
  next if num.even?
  (1..n).each do |n|
    count += 1 if num % n == 0
  end
  ans << num if count == 8
end
puts ans.size