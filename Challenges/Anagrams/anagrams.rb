class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.select do |w|
      (word.downcase.chars.sort == w.downcase.chars.sort) &&
      (word.downcase != w.downcase)
    end
  end
end