require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal(@todo2, @list.first)
  end
  
  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal(@todo2, @list.last)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
    assert_equal(true, @list.mark_all_done.done?)
  end
  
  def test_raises_type_error
    assert_raises(TypeError) { @list.add("string") }
    assert_raises(TypeError) { @list.add(1) }
  end
  
  def test_shovel
    todo = Todo.new("Shovel method")
    @list << todo
    @todos << todo
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    todo = Todo.new("Shovel method")
    @list.add(todo)
    @todos << (todo)
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(5) }
  end
  
  def test_mark_done_at
    assert_equal(false, @todo2.done?)
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(5) }
  end
  
  def test_mark_undone_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_raises(IndexError) { @list.mark_undone_at(5) }
  end
  
  def test_done!
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_remove_at
    todo = @list.remove_at(1)
    assert_equal(@todo2, todo)
    assert_equal([@todo1, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(25) }
  end
  
  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_one_done
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    new_arr = []
    @list.each { |todo| new_arr << todo }
    assert_equal(@todos, new_arr)
  end
  
  def test_each_return
    assert_equal(@list, @list.each {})
  end
  
  def test_select
    result = @list.select { |todo| todo == @todo2}
    assert_equal(@todo2, result.first)
  end
end