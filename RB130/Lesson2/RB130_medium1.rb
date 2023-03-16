#1

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end
  
#   def listen
#     return unless block_given?
#     record(yield)
#   end
  
#   def play
#     puts @recordings.last
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

#2
# class TextAnalyzer
#   def process
#     file = File.open("testfile.txt", "r")
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |contents| puts "#{contents.split("\n\n").length} paragraphs" }
# analyzer.process { |contents| puts "#{contents.split("\n").length} lines" }
# analyzer.process { |contents| puts "#{contents.split(" ").length} words" }

#3
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) do |produce|
#   puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}."
# end

#4
# def grouper(arr)
#   yield(arr)
# end

# birds = ["raven", "finch", "hawk", "eagle"]
# grouper(birds) do |_, _, *raptors|
#   p raptors
# end

#5
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# gather(items) do |*food, wheat|
#   puts food.join(", ")
#   puts wheat
# end

# # Let's start gathering food.
# # apples, corn, cabbage
# # wheat
# # We've finished gathering!

# puts ""

# gather(items) do |apples, *cc, wheat|
#   puts apples
#   puts cc.join(", ")
#   puts wheat
# end

# # Let's start gathering food.
# # apples
# # corn, cabbage
# # wheat
# # We've finished gathering!

# puts ""

# gather(items) do |apples, *food|
#   puts apples
#   puts food.join(", ")
# end

# # Let's start gathering food.
# # apples
# # corn, cabbage, wheat
# # We've finished gathering!

# puts ""

# gather(items) do |apples, corn, cabbage, wheat|
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end

#6
# # Replace the two `method_name` placeholders with actual method calls
# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# # Replace `argument` with the correct argument below
# # `method` is `Object#method`, not a placeholder
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work
# # Replace `a_proc` with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# # expected: [10, 12, 14, 16, 20, 41]

#7
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index]) 
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
