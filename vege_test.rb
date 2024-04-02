require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'vegetable'

class VegetableTest < Minitest::Test
  def test_price
    carrot = Vegetable.new("carrot", 1.99)
    assert(carrot.price)
  end
end