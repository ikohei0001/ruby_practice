def divisors_using_sqrt(x)
  result = []
# Math.sqrt(x)だと浮動小数点演算のため、xが平方数だと誤差が発生する可能性がある
# Integer.sqrt(x)だと確実に整数を返してくれる
  (1..Math.sqrt(x).to_i).each do |i|
    if x % i == 0
      result << i                     # 小さい約数を追加
      result << x / i unless i == x / i  # 対応する大きい約数を追加（重複防止）
    end
  end
  result.sort
end

def divisors(value)
  result = []
  i = 1
  median = Integer.sqrt(value)
  
  while i <= median
    quotient, remainder = value.divmod(i)
    
    if remainder == 0
      result << i
      result << quotient unless i == quotient
    end
    i += 1
  end
  result.sort
end

def divisors_on(x)
  array = []
  # selectなら1行で済む：(1..x).select{ |i| x % i == 0 }
  (1..x).each do |i|
    if x % i == 0
      array << i
    end
  end
  array.sort
end



