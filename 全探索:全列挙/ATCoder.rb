s = gets.chomp.to_s
ans = 0

(0...s.length).each do |l|
  (l...s.length).each do |r|
    check = true
    (l..r).each do |x|
      if !s[x].include?("A") && !s[x].include?("C") && !s[x].include?("G") && !s[x].include?("T")
        check = false
        break
      end
    end
    ans = [ans,s.slice(l..r).length].max if check == true
  end
end

puts ans
