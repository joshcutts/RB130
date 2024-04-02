require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(500)
    @candy = Transaction.new(5)
  end

  def test_accept_money
    @candy.amount_paid = 5
    assert_equal(505, @register.accept_money(@candy))
  end

  def test_change
    @candy.amount_paid = 10
    assert_equal(5, @register.change(@candy))
  end

  def test_receipt
    @candy.amount_paid = 10
    assert_output("You've paid $5.\n") { @register.give_receipt(@candy) }
  end

  def test_prompt_for_payment
    input = StringIO.new("5\n")
    output = StringIO.new
    @candy.prompt_for_payment(input: input, output: output)
    assert_equal(5, @candy.amount_paid)
  end
end