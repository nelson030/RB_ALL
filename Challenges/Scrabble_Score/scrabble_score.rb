class Scrabble
  attr_reader :word
  LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  SCORE = { "a" => 1,
            "b" => 3,
            "c" => 3,
            "d" => 2,
            "e" => 1,
            "f" => 4,
            "g" => 2,
            "h" => 4,
            "i" => 1,
            "j" => 8,
            "k" => 5,
            "l" => 1,
            "m" => 3,
            "n" => 1,
            "o" => 1,
            "p" => 3,
            "q" => 10,
            "r" => 1,
            "s" => 1,
            "t" => 1,
            "u" => 1,
            "v" => 4,
            "w" => 4,
            "x" => 8,
            "y" => 4,
            "z" => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless word.class == String && word.length > 0

    sum = 0

    word.downcase.chars.each do |char|
      return sum = 0 if !LETTERS.include?(char)
      sum += SCORE[char]
    end

    sum
  end
  
  def self.score(game_word)
    new_obj = Scrabble.new(game_word)
    new_obj.score
  end
end