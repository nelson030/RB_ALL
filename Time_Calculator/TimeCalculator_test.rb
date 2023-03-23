require 'minitest/autorun'

require_relative 'TimeCalculator'

class Time_Calculator_Test < Minitest::Test
  def setup
    @test1 = TimeCalculator.new(80)
  end
  
  def test_time_for_q
    assert_match(/15.75/, @test1.time_for_question(7))
  end
end