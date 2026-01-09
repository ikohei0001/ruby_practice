def calculate_bmi(height, weight)
  raise ArgumentError, "height must be > 0"  if height <= 0
  raise ArgumentError, "height must be > 0"  if weight <= 0

  meter = height.to_f / 100
  bmi = weight.to_f / (meter * meter)

  bmi.round(2)
end

def categorize_by_bmi(bmi)
  raise ArgumentError, "bmi is mot right > 0"  if bmi < 0

  case bmi
  when 0...18.5
  "低体重"
  when 18.5...25
  "普通体重"
  when 25...30
  "肥満(1度)"
  when 30...35
  "肥満(2度)"
  when 35...40
  "肥満(3度)"
  else
  "肥満(4度)"
  end
end

def measure_bmi(height, weight)
  bmi = calculate_bmi(height, weight)
  category = categorize_by_bmi(bmi)
  
  "あなたのBMIは#{bmi}で、#{category}に分類されます"
end