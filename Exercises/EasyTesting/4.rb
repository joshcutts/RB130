require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestList < Minitest::Test
  def test_list
    list = []
    # assert_equal(true, list.empty?)
    assert_empty(list)
  end
end