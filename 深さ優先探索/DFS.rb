def dfs(graph,visited,timestamp,start,time,n)
  time[:current] += 1
  visited[start-1] = true
  timestamp[start-1][0] = time[:current]

  graph[start-1].each do |nextNode|
    if nextNode > 0 && nextNode <= n && !visited[nextNode-1]
      dfs(graph,visited,timestamp,nextNode,time,n)
    end
  end

  time[:current] += 1
  timestamp[start-1][1] = time[:current]
end

n = gets.to_i
input = []
time = { current:0 }
n.times do
  input << gets.split.map(&:to_i)
end 
graph = Array.new(n,[])
visited = Array.new(n){false}
timestamp = Array.new(n){[nil,nil]}
(1..n).each { |i|timestamp[i] } 
input.each do |item|
  if item[1] == 0
    graph[item[0]-1] = [item[1]]
  else
    graph[item[0]-1] = item[2..-1]
  end
end

(0...n).each do |i|
  dfs(graph,visited,timestamp,i+1,time,n) if !visited[i]
end

# 答えの出力
timestamp.each_with_index do |ans,index|
  puts "#{index+1} #{ans[0]} #{ans[1]}"
end 

# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_B&lang=ja
# 典型問題

# # 深さ優先探索を使う場合は、配列やタイムスタンプ等、都度変更したい部分がある時
# 配列(タイムスタンプ)：Array.new(n){}として参照渡しを防ぐ方がベター
# time:ハッシュを使う方が無難。time = 0だと、不変のデータ型なので、おかしくなる
# 例) time+=1はtimeの値に+1されているのではなく、time+1した変数が新しく作成されている
# つまり配列もtimeも、想定していない部分が変更されてしまったりする