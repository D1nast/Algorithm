# 周囲８マスを調べる
def neighbor8(row,col,h,w)
  lst = []
  # [-1,0,1]は周囲のマスのインデックス
  [-1,0,1].each do |drow|
    [-1,0,1].each do |dcol|
      next if drow == 0 && dcol == 0 #drow == 0 、dcol==0は、周囲でなく中心のマスなので対象外
      nrow,ncol = row + drow, col + dcol #周囲マスのインデックスを定義
      lst << [nrow,ncol] if nrow >= 0 && nrow < h && ncol >= 0 && ncol < w #マスからはみ出なければOK
    end
  end
  lst
end

def bfs(srow,scol,h,w,s,seen)
  queue = [[srow,scol]]
  while !queue.empty?
    orow,ocol = queue.shift
    neighbor8(orow,ocol,h,w).each do |nrow,ncol|
      if !seen[nrow][ncol] && s[nrow][ncol] == '#'
        seen[nrow][ncol] = true
        queue.push([nrow,ncol])
      end
    end
  end
end

h,w = gets.split.map(&:to_i)

s = Array.new(h) { gets.chomp }
seen = Array.new(h) { Array.new(w,false) }
ans = 0

(0...h).each do |row|
  (0...w).each do |col|
    if !seen[row][col] && s[row][col] == '#'
      bfs(row,col,h,w,s,seen)
      ans += 1
    end
  end
end

puts ans

# 行の先頭から#かつ未訪問のマスを探索　→ 見つかったら幅優先探索で周囲のマスで#を探索　→ 無くなったら終了