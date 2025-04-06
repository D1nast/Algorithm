# 累積和と二重ループの二分探索
# Ciを選択した時のbi×ciを調べる

def bsearch(arr,num)
  left = 0
  right = arr.size-1

  while right - left > 1
    mid = ( left+right ) / 2
    if arr[mid] >= num
      right = mid
    else
      left = mid
    end
  end
  return [left,right]
end

N = gets.to_i
a = gets.split.map(&:to_i).sort
b = gets.split.map(&:to_i).sort
c = gets.split.map(&:to_i).sort
parts = Array.new(N){0}
ans = 0

# biを選択した時選べるcの数を探索
b.each_with_index do |bi,index|
  # 配列の左端 < bi　担保
  next if a[0] >= bi
  search = bsearch(a,bi)
  if bi > a[search[1]]
    parts[index] = search[1]+1
  else
    parts[index] = search[0]+1
  end
end
# biを選択した時の累積和
(1...N).each {|i| parts[i] += parts[i-1]}
# ciを選択した時選べるbの数を探索
c.each_with_index do |ci,index|
  # 配列の左端 < ci　担保
  next if b[0] >= ci
  search = bsearch(b,ci)
  if ci > b[search[1]]
    ans += parts[search[1]]
  else
    ans += parts[search[0]]
  end
end
puts ans