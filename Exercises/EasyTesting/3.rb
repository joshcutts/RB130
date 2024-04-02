require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestNil < Minitest::Test
  def test_nil
    value = nil
    # assert_equal(true, value.nil?)
    assert_nil(value)
  end
end