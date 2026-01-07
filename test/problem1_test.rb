require 'stringio'

backup = $stdin
$stdin = StringIO.new("10\n")

puts gets.to_i * 3

$stdin = backup
