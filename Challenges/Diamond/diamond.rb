class Diamond
  ALPHABET = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  
  i = 0
  LETTER_HASH = {}
  LETTER_HASH[ALPHABET[i]] = ALPHABET[i]
  i += 1
  inside_spaces = 1
  while i < 26
    LETTER_HASH[ALPHABET[i]] = ALPHABET[i] + " " * inside_spaces + ALPHABET[i]
      
    inside_spaces += 2
    i += 1
  end
  
  def self.make_diamond(letter)
    arr = []
    
    spaces = ALPHABET.index(letter)
    i = 0
    
    while spaces > 0
      arr << " " * spaces + LETTER_HASH[ALPHABET[i]] + " " * spaces + "\n"
      
      i += 1
      spaces -= 1
    end
    
    arr << LETTER_HASH[ALPHABET[i]] + "\n"
    spaces += 1
    i -= 1
    
    while spaces <= ALPHABET.index(letter)
      arr << " " * spaces + LETTER_HASH[ALPHABET[i]] + " " * spaces + "\n"
      
      i -= 1
      spaces += 1
    end
    
    arr.join
  end
end
