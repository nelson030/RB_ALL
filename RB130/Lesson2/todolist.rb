class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone
  end
  
  def each
    counter = 0
    
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end
    
    self
  end
  
  def select
    new_list = TodoList.new("New List")
    
    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    
    new_list
  end
  
  def find_by_title(title)
    each do |todo|
      return todo if title == todo.title
    end
    
    nil
  end
  
  def all_done
    new_list = select do |todo|
                todo.done?
              end
    return nil if new_list.todos.empty?
    new_list
  end
  
  def all_not_done
    new_list = select do |todo|
                !todo.done?
              end
    return nil if new_list.todos.empty?
    new_list
  end
  
  def mark_done(title)
    each do |todo|
      if todo.title == title
        todo.done!
        return self
      end
    end
    self
  end
  
  def mark_all_done
    each do |todo|
      todo.done!
    end
  end
  
  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# # p list.find_by_title("Buy milk")
# # p list.find_by_title("Buy dog food")

# # p list.all_done
# # p list.all_not_done

# list.mark_done("Buy milk")
# list.mark_done("Buy dog food")

# puts list.all_done
# puts list.all_not_done

# list.mark_all_done

# puts list.all_done
# puts list.all_not_done

# list.mark_all_undone

# puts list.all_done
# puts list.all_not_done
