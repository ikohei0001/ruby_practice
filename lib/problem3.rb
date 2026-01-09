def pick_even_numbers(numbers)
  numbers.select(&:even?).join(" ")
end