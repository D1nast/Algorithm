n = gets.to_i
s = gets.split.map(&:to_i)
q = gets.to_i
t = gets.split.map(&:to_i)
ans = 0
s.uniq!

(0...q).each do |i|
  num = t[i]
  # 左には配列の開始位置を、右には配列の末尾を指定
  left = 0
  right = s.size-1

  while right - left > 1
    mid = ( left+right ) / 2
    # 中央の値が探している値以上だった場合は、rightをmid（leftだとバグる）
    # s[mid] >= num　ということは numはs[mid]==num か、それ未満の数字ということになるから
    if s[mid] >= num
      right = mid
    else
      left = mid
    end

  end

  # puts "s[left]:#{s[left]} s[right]:#{s[right]} num:#{num}"
  ans += 1 if s[left] == num || s[right] == num

end

puts ans

# ごく一般的な二分探索問題