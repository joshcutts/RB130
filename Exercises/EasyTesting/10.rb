require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TextExample < Minitest::Test
  def test_xyz
    list = ['xyz']
    refute_includes(list, 'xyz')
  end
end