require_relative "../lib/problem6.rb"
require 'benchmark'

n = 1_000_000

Benchmark.benchmark do |x|
  x.report("O(n)     ") { divisors_on(n) }
  x.report("O(sqrt n)") { divisors_using_sqrt(n) }
end
