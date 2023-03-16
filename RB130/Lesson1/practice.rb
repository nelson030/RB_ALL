# def select(arr)
#   counter = 0
#   new_arr = []
  
#   while counter < arr.length
#     new_arr << arr[counter] if yield(arr[counter])
#     counter += 1
#   end
  
#   new_arr
# end

# array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true   # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

# def reduce(arr, acc = arr.class.new)
#   counter = 0
  
#   while counter < arr.length
#     acc = yield(acc, arr[counter])
#     counter += 1
#   end
  
#   acc
# end

# array = [1, 2, 3, 4, 5]

# p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
# p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

# def random(&block)
#   puts block.class
#   block.call
# end

# random {puts "hi"}

def one?(arr)
  valid_arr = arr.select do |num|
    return false if valid_arr.class != NilClass && valid_arr.size > 1
    yield(num)
  end
  valid_arr.size == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false