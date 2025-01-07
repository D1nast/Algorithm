n,m = gets.split.map(&:to_i)
coin = gets.split.map(&:to_i)
dp = Array.new(m+1){ Array.new(n+1){50001} }

# dp：コイン０番目まで使用する時の枚数
dp[0][0] = 0

(1..m).each do |i|
  (0..n).each do |j|
    useCoin = coin[ i-1 ]
    if j == 0 # jが0(=金額が0)の時はコインを入れられないので0
      dp[i][j] = 0
      next
    end
    if j >= useCoin
      dp[i][j] = [ dp[i-1][j],dp[i][j - coin[i-1]] + 1 ].min # +1ばコインを入れるため
    else
      dp[i][j] = dp[i-1][j]
    end
  end
end

puts dp[m][n]