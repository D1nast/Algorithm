n,w = gets.split.map(&:to_i)
knapsack = []
dp = Array.new(n+1){ Array.new(w+1){0} }
n.times do
  knapsack << gets.split.map(&:to_i)
end

knapsack.each_with_index do |item,index|
  vi,wi = item[0],item[1]
  (1..w).each do |i|
    dp[index+1][i] = dp[index][i]
    # 財を入れられる場合
    if i - wi >= 0
      dp[index+1][i] = [ dp[index+1][i],dp[index+1][i - wi] + vi ].max
    end
  end
end

# nが価値で、wが重さ
puts dp[n][w]
# puts knapsack.inspect
# puts dp.inspect