def reverse_a_string(string)
  raise ArgumentError, 'Must be a string' unless string.is_a?(String)
  string.reverse
end