require_relative "../lib/problem2.rb"

puts sum_array([1, 2, 3]) == 6 # 通常値テスト
puts sum_array([]) == 0        # 境界値(空配列)テスト
puts sum_array([5]) == 5       # 境界値(要素1)テスト