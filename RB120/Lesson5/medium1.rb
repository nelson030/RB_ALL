# #1
# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end
  
#   def on_or_off?
#     puts "Switch is #{switch}"
#   end
  
#   private
  
#   attr_accessor :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# # new_switch = Machine.new
# # new_switch.on_or_off?
# # new_switch.start
# # new_switch.on_or_off?
# # new_switch.stop
# # new_switch.on_or_off?

# #2
class FixedArray
  attr_reader :array
  
  def initialize(num)
    @array = [nil] * num
  end
  
  def [](i)
    array[i]
  end
  
  def []=(i, new_obj)
    array.fetch(i)
    array[i] = new_obj
  end
  
  def fetch(i)
    array.fetch(i)
  end
  
  def to_a
    array
  end
  
  def to_s
    array.to_s
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'



begin
  fixed_array.fetch(6)
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

# #3
# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
  
# end

# #4
# class CircularQueue
  
#   attr_accessor :arr
#   attr_reader :size
  
#   def initialize(size)
#     @arr = [nil] * size
#     @size = size
#   end
  
#   def oldest_spot
#     # return index of lowest number
#     only_num_arr = arr.select { |num| num.class == Integer }
#     lowest_num = only_num_arr[0]
#     only_num_arr.each do |num|
#       lowest_num = num if num < lowest_num
#     end
#     return arr.index(lowest_num)
#   end
  
#   def dequeue
#     return nil if arr.empty?
#     old = oldest_spot
#     spot = arr[old]
#     arr[old] = nil
#     spot
#   end
  
#   def enqueue(number)
#     spot = (number % size) - 1
#     arr[spot] = number
#   end
# end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

#5
# class MinilangError < StandardError; end
# class BadTokenError < MinilangError; end
# class EmptyStackError < MinilangError; end

# class Minilang
#   ACTIONS = ["PUSH", "ADD", "SUB", "MULT", "DIV", "MOD", "POP", "PRINT"]
#   START_NUMBERS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-"] 
  
#   attr_accessor :commands, :register, :stack
  
#   def initialize(phrase)
#     @register = 0
#     @stack = []
#     @commands = phrase.split(" ")
#   end
  
#   def eval
#     commands.each do |command|
#       if ACTIONS.include?(command)
#         execute_action(command)
#       elsif START_NUMBERS.include?(command[0])
#         set_register(command.to_i)
#       else
#         raise BadTokenError, "Invalid token: #{command}"
#       end
#     end
#     puts ""
#   end
  
#   private
  
#   def execute_action(word)
#     case word
#     when "PUSH"
#       push
#     when "ADD"
#       add
#     when "SUB"
#       subtract
#     when "MULT"
#       mult
#     when "DIV"
#       div
#     when "MOD"
#       mod
#     when "POP"
#       pop
#     when "PRINT"
#       print_reg
#     else
#       puts "How'd it get here?"
#     end
#   end
  
#   def set_register(number)
#     @register = number
#   end
  
#   def print_reg
#     if register == nil
#       puts "Empty stack!"
#     else
#       puts register
#     end
#   end
  
#   def push
#     stack.push(register)
#   end
  
#   def add
#     stack_num = stack.delete_at(0)
#     @register = stack_num + register
#   end
  
#   def pop
#     @register = stack.pop
#   end
  
#   def div
#     stack_num = stack.delete_at(0)
#     @register = register / stack_num
#   end
  
#   def mod
#     stack_num = stack.delete_at(0)
#     @register = register % stack_num
#   end
  
#   def subtract
#     stack_num = stack.delete_at(0)
#     @register = register - stack_num
#   end
  
#   def mult
#     stack_num = stack.delete_at(0)
#     @register = stack_num * register
#   end
# end

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# #Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

#6, 7

# class GuessingGame
#   attr_accessor :random_num, :guess_num
#   attr_reader :guesses_remaining, :min, :max
  
#   def initialize(min, max)
#     @random_num = Random.new.rand(min..max)
#     @guesses_remaining = Math.log2(max - min).to_i + 1
#     @min = min
#     @max = max
#   end
  
#   def play
#     loop do
#       show_remaining_guesses
#       user_guess
#       if @random_num == @guess_num
#         puts "That's the number!"
#         puts ""
#         puts "You won!"
#         puts ""
#         break
#       elsif @guesses_remaining == 1
#         puts "You have no more guesses. You lost!"
#         puts ""
#         break
#       elsif @random_num > @guess_num
#         puts "Your guess is too low."
#         puts ""
#         @guesses_remaining -= 1
#       else
#         puts "Your guess is too high."
#         puts ""
#         @guesses_remaining -= 1
#       end
#     end
#     reset
#   end
  
#   def reset
#     @random_num = Random.new.rand(min..max)
#     @guesses_remaining = Math.log2(max - min).to_i + 1
#   end
  
#   def show_remaining_guesses
#     if @guesses_remaining == 1
#       puts "You have #{@guesses_remaining} guess remaining."
#     else
#       puts "You have #{@guesses_remaining} guesses remaining."
#     end
#   end
  
#   def user_guess
#     guess = nil
#     loop do
#       puts "Enter a number between #{@min} and #{@max}: "
#       guess = gets.chomp.to_i
#       break if (@min..@max).to_a.include?(guess)
#       puts "Invalid guess."
#     end
#     @guess_num = guess
#   end
# end

# game = GuessingGame.new(501, 1500)
# game.play

# game.play

#8

# class Card
#   include Comparable
#   attr_reader :rank, :suit

#   VALUES = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def value
#     VALUES.fetch(rank, rank)
#   end

#   def <=>(other)
#     value <=> other.value
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end
# end

# # insert Card class from previous exercise here

# class Deck
#   RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze

#   def initialize
#     reset
#   end

#   def draw
#     reset if @deck.empty?
#     @deck.pop
#   end
  
#   def to_a
#     @deck
#   end

#   private

#   def reset
#     @deck = RANKS.product(SUITS).map do |rank, suit|
#       Card.new(rank, suit)
#     end

#     @deck.shuffle!
#   end
# end

# # Include Card and Deck classes from the last two exercises.

# class PokerHand
#   attr_accessor :hand

#   def initialize(hand)
#     @hand = hand.to_a[0..4]
#   end

#   def print
#     puts hand
#   end

#   def evaluate
#     case
#     when royal_flush?     then 'Royal flush'
#     when straight_flush?  then 'Straight flush'
#     when four_of_a_kind?  then 'Four of a kind'
#     when full_house?      then 'Full house'
#     when flush?           then 'Flush'
#     when straight?        then 'Straight'
#     when three_of_a_kind? then 'Three of a kind'
#     when two_pair?        then 'Two pair'
#     when pair?            then 'Pair'
#     else                       'High card'
#     end
#   end

#   private
  
#   def sort_ranks
#     ranks = hand.map do |card|
#       card.value
#     end
#     ranks.sort!
#   end
  
#   def value_hash
#     ranks = sort_ranks
#     counter = {}
#     ranks.each do |rank|
#       if counter[rank]
#         counter[rank] += 1
#       else
#         counter[rank] = 1
#       end
#     end
#     counter
#   end

#   def royal_flush?
#     ranks = sort_ranks
#     flush? && ranks == [10, 11, 12, 13, 14]
#   end

#   def straight_flush?
#     straight? && flush?
#   end

#   def four_of_a_kind?
#     counter = value_hash
#     counter.values.any?(4)
#   end

#   def full_house?
#     counter = value_hash
#     counter.values.any?(3) && counter.values.any?(2)
#   end

#   def flush?
#     hand.all? { |card| card.suit == Deck::SUITS[0] } ||
#     hand.all? { |card| card.suit == Deck::SUITS[1] } ||
#     hand.all? { |card| card.suit == Deck::SUITS[2] } ||
#     hand.all? { |card| card.suit == Deck::SUITS[3] }
#   end

#   def straight?
#     ranks = sort_ranks
#     straight_possibilities = [[2, 3, 4, 5, 6], [3, 4, 5, 6, 7], [4, 5, 6, 7, 8],
#                               [5, 6, 7, 8, 9], [6, 7, 8, 9, 10], 
#                               [7, 8, 9, 10, 11], [8, 9, 10, 11, 12],
#                               [9, 10, 11, 12, 13], [10, 11, 12, 13, 14]]
#     straight_possibilities.include?(ranks)
#   end

#   def three_of_a_kind?
#     counter = value_hash
#     counter.values.any?(3)
#   end

#   def two_pair?
#     counter = value_hash
#     counter.values.count { |num| num==2 } == 2
#   end

#   def pair?
#     counter = value_hash
#     counter.values.any?(2)
#   end
# end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# # Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# # Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand.evaluate == 'Royal flush'

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'
