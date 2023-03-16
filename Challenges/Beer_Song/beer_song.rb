class BeerSong
  def self.verse(start)
    if start == 0
      song = "No more bottles of beer on the wall, no more bottles of beer.\n" \
               "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif start == 1
      song = "#{start} bottle of beer on the wall, #{start} bottle of beer.\n" \
             "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif start == 2
      song = "#{start} bottles of beer on the wall, #{start} bottles of beer.\n" \
             "Take one down and pass it around, #{start - 1} bottle of beer on the wall.\n"
    else
      song = "#{start} bottles of beer on the wall, #{start} bottles of beer.\n" \
               "Take one down and pass it around, #{start - 1} bottles of beer on the wall.\n"
    end

    song
  end
  
  def self.verses(start, finish)
    i = start
    
    song = [self.verse(start)]
    
    while i > finish
      i -= 1
      
      if i == 0
        song << "No more bottles of beer on the wall, no more bottles of beer.\n" \
                "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      elsif i == 1
        song << "#{i} bottle of beer on the wall, #{i} bottle of beer.\n" \
               "Take it down and pass it around, no more bottles of beer on the wall.\n"
      elsif i == 2
        song << "#{i} bottles of beer on the wall, #{i} bottles of beer.\n" \
               "Take one down and pass it around, #{i - 1} bottle of beer on the wall.\n"
      else
        song << "#{i} bottles of beer on the wall, #{i} bottles of beer.\n" \
                "Take one down and pass it around, #{i - 1} bottles of beer on the wall.\n"
      end
    end
    
    song.join("\n")
  end
  
  def self.lyrics
    self.verses(99, 0)
  end
end