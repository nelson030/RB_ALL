require 'minitest/autorun'

class EasyTest < MiniTest::Test
  def test_odd
    assert(3.odd?, "Value is not odd")
  end
  
  def test_downcase
    value = "XYZ"
    assert_equal("xyz", value.downcase)
  end
  
  def test_nil
    value = nil
    assert_nil(value)
  end
  
  def test_empty
    list = []
    assert_empty(list)
  end
  
  def test_include
    list = ["xyz"]
    assert_includes(list, ("xyz"))
  end
  
  # def test_noexperience_error
  #   assert_raises(NoExperienceError) {employee.hire}
  # end
  
  # def test_direct_instance
  #   assert_instance_of(Numeric, value)
  # end
  
  # def test_a_kind_of
  #   assert_kind_of(Numeric, value)
  # end
  
  # def test_object
  #   assert_same(list, list.process)
  # end
  
  def test_not_include
    list = []
    refute_includes(list, ("xyz"))
  end
end