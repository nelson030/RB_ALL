class Octal
  NUMBERS = %w(1 2 3 4 5 6 7 0)

  def initialize(num_str)
    @num_str = num_str
  end

  def to_decimal
    return 0 if num_str.chars.any? { |char| !NUMBERS.include?(char) }
    length = num_str.length
    last = length - 1
    arr = []

    length.times do |power|
      num = num_str[last - power].to_i
      arr << (num * (8**power))
    end
    arr.reduce(:+)
  end

  private

  attr_reader :num_str
end