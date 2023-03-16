class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
                  
  attr_accessor :play_spot
  
  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares) # => we wish this method existed
        return squares.first.marker # => return the marker, whatever it is
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  
  def smart_opportunity?(player_marker, computer_marker)
    offense = nil
    defense = nil
    spot5 = nil
    WINNING_LINES.each do |line|
      square_objects = @squares.values_at(*line)
      arr = []
      square_objects.each do |sq_line|
        arr << sq_line.marker
      end
      # check winning opportunity first
      if (arr.sort[0] == " " && arr.sort[1] == computer_marker &&
                 arr.sort[2] == computer_marker)
        offense = line[arr.index(" ")]
      end
      # check defense opportunity
      if (arr.sort[0] == " " && arr.sort[1] == player_marker &&
                 arr.sort[2] == player_marker)
        defense = line[arr.index(" ")]
      end
      # check for spot 5 availability
      if line.include?(5) && arr[1] == " "
        spot5 = 5
      end
    end
    if offense
      @play_spot = offense
      return true
    elsif defense
      @play_spot = defense
      return true
    elsif spot5
      @play_spot = spot5
      return true
    else
      return nil
    end
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = @human_marker

  attr_reader :board, :human, :computer
  attr_accessor :user_num_wins, :computer_num_wins, :human_marker, :human_name,
                :computer_name

  def initialize
    @board = Board.new
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @user_num_wins = 0
    @computer_num_wins = 0
    set_human_marker
    @human = Player.new(@human_marker)
    @human_name = set_name(human, "human")
    @computer_name = set_name(computer, "computer")
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def play
    clear
    display_welcome_message
    loop do
      display_board
      player1 = decide_first_player
      if player1 == "human"
        loop do
          human_moves
          break if board.someone_won? || board.full?
          computer_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board
        end
      else
        loop do
          computer_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board
          human_moves
          break if board.someone_won? || board.full?
        end
      end
      display_result
      track_win(board.winning_marker)
      break if user_num_wins == 5 || computer_num_wins == 5
      show_score
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private
  
  def set_name(player, type_of_player)
    name = nil
    loop do
      puts "What name would you like to use for the computer?" if type_of_player.downcase == "computer"
      puts "What name would you like to use for yourself?" if type_of_player.downcase == "human"
      name = gets.chomp
      break unless name.length == 0
      puts "Name must be at least one character."
    end
    name
  end
  
  def set_human_marker
    marker = nil
    loop do
      puts "What marker would you like to use?"
      marker = gets.chomp
      break if marker.length == 1 && marker != "O"
      puts "Invalid. Can only use 1 character that is not 'O'"
    end
    @human_marker = marker
  end
  
  def decide_first_player
    answer = nil
    loop do
      puts "Would you like to go first? (y/n)"
      answer = gets.chomp.downcase[0]
      break if answer == "y" || answer == "n"
      puts "Invalid. Only type 'y' or 'n'"
    end
    return "computer" if answer == "n"
    "human"
  end

  def show_score
    puts "#{@human_name}: #{user_num_wins} wins. #{@computer_name}: #{computer_num_wins} wins."
  end
  
  def track_win(winner)
    user_wins if winner == human.marker
    computer_wins if winner == computer.marker
  end

  def user_wins
    self.user_num_wins += 1
  end
  
  def computer_wins
    self.computer_num_wins += 1
  end

  def display_welcome_message
    puts "Welcome to tic-tac-toe."
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing!"
    puts ""
  end

  def clear
    system 'clear'
  end

  def display_board
    puts "#{@human_name} are #{human.marker}'s. #{@computer_name} is #{computer.marker}'s."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when @human_marker
      puts "#{@human_name} wins!"
    when COMPUTER_MARKER
      puts "#{@computer_name} wins."
    else
      puts "It's a tie."
    end
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first.to_s
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  def human_moves
    puts "Choose a square between #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Invalid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    if board.smart_opportunity?(@human_marker, COMPUTER_MARKER)
      board[board.play_spot] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end
  

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = @human_marker
    end
  end

  def human_turn?
    @current_marker == @human_marker
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
