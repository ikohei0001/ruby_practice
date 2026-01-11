def custom_sort(words)
  words.sort{ |a, b|
    comparison = a.downcase <=> b.downcase
    if comparison == 0
      comparison = -(a <=> b)
    end
    comparison
  }
end

def ai_custom_sort(words)
  words.sort_by do |w|
    [
      w.downcase,
      case
      when w == w.downcase
        0  # lowercase
      when w == w.capitalize
        1  # capitalized
      else
        2  # uppercase / others
      end,
      w
    ]
  end
end

