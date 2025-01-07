def dfs(map,visited,row,col,w,h)
  visited[row][col] = true
  if map[row][col] == 1
    [-1,0,1].each do |drow|
      [-1,0,1].each do |dcol|
        # drow == 0 、dcol==0は、周囲でなく中心のマスなので対象外
        next if drow == 0 && dcol == 0
        # 周囲マスのインデックスを定義
        nrow,ncol = row + drow, col + dcol 
        # マスからはみ出なければOK
        if nrow >= 0 && nrow < h && ncol >= 0 && ncol < w && !visited[nrow][ncol] && map[nrow][ncol] == 1
          dfs(map,visited,nrow,ncol,w,h)
        end
      end
    end
  end
end

w,h = gets.split.map(&:to_i)
row,col = nil,nil
ans = []
while !(w == 0 && h == 0)
  map = []
  visited = Array.new(h){Array.new(w){false}}
  island = { count:0 }
  h.times do
    map << gets.split.map(&:to_i)
  end
  (0...h).each do |i|
    (0...w).each do |j|
      row,col = i,j
      if !visited[row][col] && map[row][col] == 1
        dfs(map,visited,row,col,w,h)
        island[:count] += 1
      end
    end
  end
  ans << island[:count]

  # 入力が 0,0ならループ終了
  w,h = gets.split.map(&:to_i)
end

ans.each do |num|
  puts num
end

# ChatGPTにC++に変換してもらうとACする
# 恐らくRubyだと遅くて実行制限時間超過する(1sec)
# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1160&lang=ja