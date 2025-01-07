require 'set'
set = Set.new([])
arr = Array.new(3,0)

loop do
  n,x = gets.split.map(&:to_i)

  break if n==0 && x==0

  (1..n).each do |one|
    (one+1..n).each do |two|
      (two+1..n).each do |three|
        if one + two + three == x
          arr[0] = one
          arr[1] = two
          arr[2] = three
          arr.sort!
          set.add(arr)
          arr.clear
        end
      end
    end
  end
  puts set.size
  set.clear
end