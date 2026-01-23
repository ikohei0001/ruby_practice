def custom_sort(words)
  words.sort{ |a, b|
    comparison = a.downcase <=> b.downcase
    if comparison == 0
      comparison = -(a <=> b)  # b <=> aでもよい
    end
    comparison
  }
end

def ai_custom_sort(words)
  words.sort_by{ [_1.downcase, _1.swapcase] }
end

