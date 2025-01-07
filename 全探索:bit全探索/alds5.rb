n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i
m = gets.split.map(&:to_i)
ans = []

(0...(1<<n)).each do |i|
  calc = 0
  (0...n).each do |shift|
    if ( i>>shift ) & 1 == 1
      calc += a[shift]
    end
  end
  ans << calc
end

m.each do |query|
  if ans.include?(query)
    puts "yes"
  else
    puts "no"
  end
end


# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_5_A&lang=ja
