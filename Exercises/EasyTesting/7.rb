require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestNumeric < Minitest::Test
  def test_numeric
    value = Numeric.new()
    # assert_equal(true, value.instance_of?(Numeric))
    assert_instance_of(Numeric, value)
  end
end