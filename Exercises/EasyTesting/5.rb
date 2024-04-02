require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestInclude < Minitest::Test
  def test_include
    list = ['xyz']
    assert_includes(list, 'xyz')
  end
end
