# セッティング
n,m = gets.split.map(&:to_i)
switch = []
lb = []
m.times do
  lb << gets.split.map(&:to_i)
end
p = gets.split.map(&:to_i)
ans = 0

# スイッチの組み合わせをbit全探索
(0...(1<<n)).each do |i|
  list = Array.new(n)
  (0...n).each do |shift|
    if ( i>>shift ) & 1 == 1
      list[shift] = true
    else
      list[shift] = false
    end
  end
  switch << list
end
# スイッチ毎に全ての電球が点灯するかループ
switch.each do |item|
  ok = 0
  # puts "switch:#{item}"
  # 各電球のスイッチループ
  (0...m).each do |i|
    on = 0
    lb[i].each_with_index do |bulb,index|
      next if index == 0
      on += 1 if item[bulb-1] == true
    end
    # ok += 1 if on > 0 && (on % 2) == p[i]
    ok += 1 if on%2==p[i]
    # puts "スイッチon:#{on} p:#{p[i]} lb#{lb[i].inspect} ok:#{ok}"
  end
  ans += 1 if ok == m
  # puts "ans:#{ans} m:#{m}"
end

puts ans
# puts switch.inspect
# puts switch.size
# 
# ０も偶数に含まれることに注意