require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    []
  end
end

class TestProcess < Minitest::Test
  def test_list
    list = List.new
    assert_same(list, list.process)
  end
end