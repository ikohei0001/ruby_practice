def calculate_mean(numbers)
  raise ArgumentError, "Must contain at least one element" if numbers.empty?
  raise ArgumentError, "All elements must be numbers" unless numbers.all? { |n| n.is_a?(Numeric) }

  numbers.sum / numbers.length.to_f
end

def calculate_standard_deviation(numbers)
  raise ArgumentError, "Must contain at least one value" if numbers.empty?
  raise ArgumentError, "All elements must be numbers" unless numbers.all? { |n| n.is_a?(Numeric) }

  mean = numbers.sum / numbers.length.to_f
  variance = numbers.map { |n| (n - mean) ** 2 }.sum / numbers.length.to_f

  Math.sqrt(variance)
end

def calculate_median(numbers)
  raise ArgumentError, "Must contain at least one value" if numbers.empty?
  raise ArgumentError, "All elements must be numbers" unless numbers.all? { |n| n.is_a?(Numeric) }

  sorted = numbers.sort
  n = sorted.length
  mid = n / 2

  if n.odd?
    sorted[mid]
  else
    (sorted[mid - 1] + sorted[mid]) / 2.0
  end
end

def calculate_mode(numbers)
  raise ArgumentError, "Must contain at least one value" if numbers.empty?
  raise ArgumentError, "All elements must be numbers" unless numbers.all? { |n| n.is_a?(Numeric) }

  counts = numbers.tally
  max_count = counts.values.max

  counts.select { |_, v| v == max_count }.keys
end

def calculate_status(numbers)
  {
    mean: calculate_mean(numbers),
    standard_deviation: calculate_standard_deviation(numbers),
    median: calculate_median(numbers),
    mode: calculate_mode(numbers)
  }
end
