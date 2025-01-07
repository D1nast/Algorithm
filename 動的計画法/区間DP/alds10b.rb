n = gets.to_i
data = []
n.times do
  data << gets.split.map(&:to_i)
end
matrix = [data[0][0]] + data.map{ |d| d = d[-1] }
dp = Array.new(n+1){ Array.new(n+1,0) }

2.upto(n) do |length|
  1.upto( n-length+1 ) do |i|
    j = i + length - 1
    dp[i][j] = Float::INFINITY
    i.upto( j-1 ) do |k|
      tmp = dp[i][k] + dp[ k+1 ][j] + matrix[ i-1 ] * matrix[k] * matrix[j]
      dp[i][j] = [ dp[i][j],tmp ].min
    end
  end
end
puts dp[1][n]
puts matrix.inspect
puts dp.inspect
# 左の列数 = 右の行数　の時のみ行列の掛け算可
# 計算量：X(左の行数) * Y(左の列数) * Z(右の列数)
# 連鎖行列の計算：必ず一番左の行列の行数がX、右の列数がZ
# 行列の積（新たな行列）：左の行数 * 右の列数


BCの積(2,1)
BCの計算量(2,3,1)
ABCの積(3,1)
ABCの計算量(3,2,1)