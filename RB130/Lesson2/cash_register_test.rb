require "minitest/autorun"
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction1 = Transaction.new(50)
    @transaction2 = Transaction.new(100)
    @transaction3 = Transaction.new(150)
  end
  
  def test_accept_money
    @transaction1.amount_paid = 50
    
    old_total = @register.total_money
    @register.accept_money(@transaction1)
    new_total = @register.total_money
    assert_equal(old_total + 50, new_total)
  end
  
  def test_change
    @transaction1.amount_paid = 80
    change = @register.change(@transaction1)
    assert_equal(30, change)
  end
  
  def test_receipt
    @transaction1.amount_paid = 50
    assert_output("You've paid $50.\n") { @register.give_receipt(@transaction1) }
  end
  
  def test_payment_prompt
    input1 = StringIO.new("50")
    output1 = StringIO.new
    @transaction1.prompt_for_payment(input: input1, output: output1)
    assert_equal(50, @transaction1.amount_paid)
  end
end