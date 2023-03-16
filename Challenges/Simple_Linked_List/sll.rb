class Element
  attr_reader :datum, :next
  
  def initialize(datum, n=nil)
    @next = n
    @datum = datum
  end
  
  def tail?
    obj = self

    loop do
      break if obj.next == nil
      obj = obj.next
    end
    
    obj == self
  end
end

class SimpleLinkedList
  attr_reader :head
  
  def size
    s = 0
    current_elem = @head
    while !(current_elem == nil)
      s += 1
      current_elem = current_elem.next
    end
    s
  end
  
  def empty?
    @head == nil
  end
  
  def push(datum)
    elem = Element.new(datum, @head)
    @head = elem
  end
  
  def peek
    @head.datum if @head
  end
  
  def pop
    old = @head.datum
    new = @head.next
    @head = new
    old
  end
  
  def self.from_a(arr)
    arr = [] if arr == nil
    arr = arr.reverse
    new_list = SimpleLinkedList.new
    
    arr.each do |val|
      new_list.push(val)
    end
    
    new_list
  end
  
  def to_a
    arr = []
    current_elem = head
    while !(current_elem == nil)
      arr << current_elem.datum
      current_elem = current_elem.next
    end
    arr
  end
  
  def reverse
    arr = to_a.reverse
    SimpleLinkedList.from_a(arr)
  end
  
  private
  
  attr_reader :list
end
