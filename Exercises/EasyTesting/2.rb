require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class DowncaseTest < Minitest::Test
  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end