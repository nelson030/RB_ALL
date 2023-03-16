#1

# factorial = Enumerator.new do |y|
#   total = 1
#   number = 0
  
#   loop do
#     if number == 0
#       total = 1
#     else
#       total = total * number
#     end
#     y << total
#     number += 1
#   end
# end

# 6.times { |num| p "#{num}! is #{factorial.next}." }
# factorial.rewind
# 6.times { |num| p "#{num}! is #{factorial.next}." }

# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 25
# end

#2

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
# Can call a proc with insufficient arguments given vs expected
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
#my_lambda.call
# ArgumentError. (given 0, expected 1)
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# NameError. Invalid way to initialize a lambda. Because a lambda is a part of 
# the Proc class and is NOT a class itself

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
#block_method_1('seal')
# LocalJumpError. no block is given to yield.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}
# NameError. `animal` is not an argument or a variable of any kind in the scope
# of the block on line 68

# Group 1
# - A proc belongs to the Proc class. 
# - A proc closure does not require all arguments to be provided 
# (There can be too few or too many). If too few, extras are `nil`
# - Anything in `()` after the closure is used as an argument.

# Group 2
# - A lambda belongs to the Proc class. 
# - A lambda is not a class.
# - A lambda closure requires the exact number of arguments as specified.
# - A lambda can be initialized in 2 ways (line 38 and 39).

# Group 3
# - When calling `yield`, there needs to be a block, proc, or lambda in scope
# to access

# Group 4
# - A block does not require all arguments to be provided
# (There can be too few or too many). If too few, extras are `nil`
# - local variable name passed to yield is out of scope of block being passed to
# Need to assign an argument to receive that closure.

# Proc
# - of the Proc class
# - Doesnt't need to be passed all arguments to run. Extra arguments ar `nil`

# Lambda
# - of the Proc class
# - Needs exact number of arguments to be fulfilled.

# Block
# - Can be passed to yield
# - Doesnt't need to be passed all arguments to run. Extra arguments ar `nil`
