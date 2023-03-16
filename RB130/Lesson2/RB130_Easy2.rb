#1
# def step(first, last, step)
#   i = first
  
#   while i <= last
#     yield(i)
#     i += step
#   end
  
#   i
# end

# p step(1, 10, 3) { |value| puts "value = #{value}" }

#2
# def zip(arr1, arr2)
#   i = 0
#   new_arr = []
  
#   while i < arr1.length
#     new_arr << [arr1[i], arr2[i]]
#     i += 1
#   end
  
#   new_arr
# end

# p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

#3
# def map(arr)
#   i = 0
#   result = []
  
#   while i < arr.length
#     result << yield(arr[i])
#     i += 1
#   end
  
#   result
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

#4
# def count(*arguments)
#   valid_arr = arguments.select { |num| yield(num) }
#   valid_arr.size
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

#5
# def drop_while(arr)
#   i = 0
#   new_arr = []
#   hit_falsey = false
  
#   while i < arr.length
#     hit_falsey = true if !yield(arr[i])
#     new_arr << arr[i] if hit_falsey
#     i += 1
#   end
  
#   new_arr
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

#6
# def each_with_index(arr)
#   i = 0
  
#   while i < arr.length
#     yield(arr[i], i)
#     i += 1
#   end
  
#   arr
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

#7
# def each_with_object(arr, new_collection)
#   i = 0
  
#   while i < arr.length
#     yield(arr[i], new_collection)
#     i += 1
#   end
  
#   new_collection
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

#8
# def max_by(arr)
#   return nil if arr[0] == nil
#   max_yield = nil
#   max = nil
#   arr.each do |num|
#     if max_yield == nil || yield(num) > max_yield
#       max = num
#       max_yield = yield(num)
#     end
#   end
#   max
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

#9, 10
# def each_cons(arr, n)
#   arr.each_index do |i|
#     break if (i + n) > arr.length
#     yield(*arr[(i)..(i + n - 1)])
#   end
  
#   nil
# end

# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# p hash == {}

#10

def each_cons(arr, n)
  arr.each_index do |i|
    break if (i + n) > arr.length
    yield(*arr[(i)..(i + n - 1)])
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash #== { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}

