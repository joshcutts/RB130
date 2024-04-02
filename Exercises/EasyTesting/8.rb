require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestNumeric < Minitest::Test
  def test_numeric
    value = Numeric.new
    value2 = 5
    value3 = 5.0
    classes = [Numeric] + Numeric.subclasses
    assert_equal(true, classes.include?(value.class))
    assert_equal(true, classes.include?(value2.class))
    assert_equal(true, classes.include?(value3.class))
  end
end

class TestNumeric < Minitest::Test
  def test_numeric
    value = Numeric.new
    value1 = 2
    assert_kind_of(Numeric, value)
    assert_kind_of(Numeric, value)

  end
end

# p Integer.methods.sort
# p Numeric.subclasses + [Numeric]