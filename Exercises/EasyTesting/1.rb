require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!



class TestOdd < Minitest::Test
  def test_odd
      value = 3
      assert(value.odd?, 'value is not odd')
#     val = 2
#     assert_equal(true, val.odd?)
  end
end

