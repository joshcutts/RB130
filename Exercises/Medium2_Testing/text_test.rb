require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

# a = File.open('sample_text.txt', 'r')
# p a.read

# b = File.read('sample_text.txt')
# p b


class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
    @text = Text.new(@file.read)
    @swapped = "Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\nSuspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\nquem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\nnulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\ndolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\net verius meuris, et pheretre mi."
  end

  def test_swap
    assert_equal(@swapped, @text.swap('a', 'e'))
  end

  def test_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end