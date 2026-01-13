class RomanConverter
  ROMAN_MAP = {
    "M"  => 1000,
    "CM" => 900,
    "D"  => 500,
    "CD" => 400,
    "C"  => 100,
    "XC" => 90,
    "L"  => 50,
    "XL" => 40,
    "X"  => 10,
    "IX" => 9,
    "V"  => 5,
    "IV" => 4,
    "I"  => 1
  }

  def self.to_roman(num)
    raise ArgumentError , "Please specify an integer between 1 and 3999" unless num.is_a?(Integer) && (1..3999).include?(num)
      
    roman = ""
      
    ROMAN_MAP.each do |roman_char, value|
      count, num = num.divmod(value)
      roman << roman_char * count
    end
    roman
  end
 
 ROMAN_REGEX = /\A
    M{0,3}
    (CM|CD|D?C{0,3})
    (XC|XL|L?X{0,3})
    (IX|IV|V?I{0,3})
  \z/x

  def self.from_roman(roman)
    raise ArgumentError, "Input cannot be nil or empty" if roman.nil? || roman.empty?

    roman = roman.upcase
    raise ArgumentError, "Invalid Roman numeral" unless roman.match?(ROMAN_REGEX)
    num = 0
    i = 0
      
    while i < roman.length
      if i + 1 < roman.length && ROMAN_MAP.key?(roman[i, 2])
        num += ROMAN_MAP[roman[i, 2]]
        i += 2
      else
        raise ArgumentError, "不正なローマ数字です" unless ROMAN_MAP.key?(roman[i])
        
        num += ROMAN_MAP[roman[i]]
        i += 1
      end
    end
    num
  end
end

puts RomanConverter.to_roman(1987)    # => "MCMLXXXVII"
puts RomanConverter.from_roman("MCMLXXXVII") # => 1987
