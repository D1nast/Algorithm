n,w = gets.split.map(&:to_i)
knapsack = []
dp = Array.new(n+1){ Array.new(w+1){0} }
n.times do
  knapsack << gets.split.map(&:to_i)
end

knapsack.each_with_index do |item,index|
  (1..w).each do |i|
    # 許容量が各アイテムの重さを下回るなら、アイテムを入れない
    if i - item[1] < 0
      # アイテムの重みが、許容量以下ならアイテムを入れず、前までの結果を入れる
      dp[index+1][i] = dp[index][i]
    else
      # アイテムを入れられる重さなら、前の結果と今入れた場合の結果で価値が高くなるのを入れる、
      dp[index+1][i] = [ dp[index][i] , dp[index][i-item[1]] + item[0] ].max
    end
  end
end

# nが価値で、wが重さ
puts dp[n][w]
# puts dp.inspect
# puts knapsack.inspect
