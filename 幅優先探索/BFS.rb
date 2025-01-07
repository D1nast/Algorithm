def bfs(graph,start,ans,n)

  visited = Array.new(n+1,false)
  queue = []

  visited[start] = true
  ans[start] = 0
  queue.push(start)

  while !queue.empty?
    node = queue.shift

    graph[node].each do |nextNode|
      unless visited[nextNode]
        visited[nextNode] = true
        ans[nextNode] = ans[node] + 1
        queue.push(nextNode)
      end
    end
  end

end

n = gets.to_i
graph = Hash.new{[]}
ans = Array.new(n+1,-1)

n.times do
  v = gets.split.map(&:to_i)
  node = v[0]
  neighbors = v[2..-1]
  graph[node] = neighbors  
end

bfs(graph,1,ans,n)

# puts graph.inspect
# puts ans.inspect

(1..n).each {|i| puts "#{i} #{ans[i]}"} 

# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_C&lang=ja
# 典型的な幅優先探索の問題
