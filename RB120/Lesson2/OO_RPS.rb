class RPSGame
  attr_accessor :human, :computer

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
    else
      puts "It's a tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)?"
      answer = gets.chomp
      break if answer.downcase == 'y' || answer.downcase == 'n'
      puts "Sorry. Must be y or n."
    end
    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def play
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry. You must enter something."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors."
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry. Invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Chad', 'C3P0'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

RPSGame.new.play
