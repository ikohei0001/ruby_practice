require "minitest/autorun"
require_relative "../lib/problem3.rb"

class TestEvenNumber < Minitest::Test
  def test_even_number
    assert_equal "2 4", pick_even_numbers([1, 2, 3, 4])
  end

  def test_even_number_empty
    assert_equal "", pick_even_numbers([])
  end

  def test_single_element_even
    assert_equal "2", pick_even_numbers([2])
  end

  def test_single_element_odd
    assert_equal "", pick_even_numbers([1])
  end

  def test_all_even
    assert_equal "2 4 6", pick_even_numbers([2, 4, 6])
  end

  def test_keeping_the_order
    assert_equal "6 2 4", pick_even_numbers([1, 6, 3, 2, 4])
  end
end

