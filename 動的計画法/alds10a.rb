def f(n,memo)
  return 1 if n == 1 || n == 0
  return memo[n] if memo.key?(n)
  
  memo[n] = f( n-1,memo ) + f( n-2,memo )
  return memo[n]
end

n = gets.to_i
memo = {}
puts f(n,memo)

# フィボナッチ数列の問題　メモにある答えはメモから
# 例 f(6) 答え:13
# 1. f(5) + f(4)
# 2. f(4) + f(3)
# 3. f(3) + f(2)
# 4. f(2) + f(1)
# 5. f(1) + f(0)