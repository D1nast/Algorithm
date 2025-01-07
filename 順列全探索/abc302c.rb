n,m = gets.split.map(&:to_i)
arr = []
n.times do
  s = gets.chomp
  arr << s
end
perm = arr.permutation.to_a
perm.each do |item|
  tmp = ""
  (0...n).each do |i|
    ok = true
    if i == 0
      tmp = item[0]
      next
    end
    count = 0
    (0...m).each do |j|
      count += 1 if tmp[j] != item[i][j]
      if count > 1
        ok = false
        break
      end
    end

    tmp = item[i]
    break if ok == false
    if i+1 == n
      puts "Yes"
      exit
    end
  end
end

puts "No" 
# puts perm.inspect