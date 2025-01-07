def bsearch(arr,center)
  left = 0
  right = arr.size-1

  while right - left > 1
    mid = ( left+right ) / 2
    if arr[mid] >= center
      right = mid
    else
      left = mid
    end
  end
  return [left,right]
end

n = gets.to_i
a = gets.split.map(&:to_i).sort
b = gets.split.map(&:to_i).sort
c = gets.split.map(&:to_i).sort
ans = 0

# puts a.inspect
# puts b.inspect
# puts c.inspect

b.each do |center|
  # puts "b:#{center}"
  upper = bsearch(a,center)
  lower = bsearch(c,center)

  if a[upper[1]] < center
    calcA = upper[1] + 1
  else
    calcA = upper[0] + 1
  end
  if c[lower[0]] > center
    calcB = c.size - lower[0]
  elsif c[lower[1]] == center
    calcB = c.size - lower[1] - 1
  else
    calcB = c.size - lower[1]
  end

  ans += calcA * calcB
  # puts "center:#{center} calcA:#{calcA} calcB:#{calcB} upper:#{upper.inspect} lower:#{lower.inspect} ans:#{ans}"

end

puts ans
# C * log