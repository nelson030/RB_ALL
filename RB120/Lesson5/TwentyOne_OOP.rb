module CardInfo
  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  SUITS = ["♠", "♣", "♥", "⬥"]
end

class Player
  include CardInfo

  attr_accessor :hand

  def initialize
    @hand = []
  end

  def reset
    @hand = []
  end

  def hit(deck)
    suit = SUITS.sample
    val = deck[suit].sample
    hand << [suit, val]
    deck[suit].delete(val)
  end

  def busted?
    total > 21
  end

  def total
    sum = 0
    sorted_hand = hand_with_ace_at_end
    sorted_hand.each do |card_arr|
      if card_arr[1] == "J" || card_arr[1] == "Q" || card_arr[1] == "K"
        sum += 10
      elsif card_arr[1] == "A"
        if sum <= 10
          sum += 11
        else
          sum += 1
        end
      else
        sum += card_arr[1].to_i
      end
    end
    sum
  end

  def hand_with_ace_at_end
    new_hand = []
    ace_cards = []
    hand.each do |card_arr|
      if card_arr[1] == "A"
        ace_cards << card_arr
      else
        new_hand << card_arr
      end
    end
    new_hand += ace_cards
  end

  def show_dealer_card
    puts "#{hand[0][1]} #{hand[0][0]}"
  end

  def show_all_cards
    hand.each do |card_arr|
      puts "#{card_arr[1]} #{card_arr[0]}"
    end
  end
end

class Deck
  include CardInfo

  attr_accessor :cards

  def initialize
    @cards = { SUITS[0] => VALUES.dup, SUITS[1] => VALUES.dup,
               SUITS[2] => VALUES.dup, SUITS[3] => VALUES.dup }
  end

  def reset
    @cards = { SUITS[0] => VALUES.dup, SUITS[1] => VALUES.dup,
               SUITS[2] => VALUES.dup, SUITS[3] => VALUES.dup }
  end
end

class Card
  def initialize
    # what are the "states" of a card?
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new()
    @dealer = Player.new()
    @deck = Deck.new
  end

  def start
    loop do
      deal_cards
      show_cards
      player_turn
      dealer_turn
      show_result
      break if !play_again?
      reset_game
      clear_screen
    end
  end

  def clear_screen
    system 'clear'
  end

  def reset_game
    player.reset
    dealer.reset
    deck.reset
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y or n)"
      answer = gets.chomp
      break if answer == "y" || answer == "n"
      puts "Invalid. Only 'y' or 'n'"
      puts ""
    end
    return true if answer == "y"
    false
  end

  def deal_cards
    player.hit(deck.cards)
    dealer.hit(deck.cards)
    player.hit(deck.cards)
    dealer.hit(deck.cards)
  end

  def show_cards
    puts "Your cards: "
    player.show_all_cards
    puts ""
    puts "Dealer's cards: "
    dealer.show_dealer_card
    puts ""
  end

  def player_turn
    puts "Your turn: "
    loop do
      move = nil
      loop do
        puts "Would you like to hit or stay? (h or s)"
        move = gets.chomp.downcase[0]
        break if move == "h" || move == "s"
        puts "Invalid. Only 'h' or 's' are acceptable."
      end
      if move == "h"
        player.hit(deck.cards)
        show_cards
      else
        break
      end
      break if player.busted?
    end
  end

  def dealer_turn
    loop do
      break if player.busted?
      break if dealer.total > player.total || dealer.total == 21
      dealer.hit(deck.cards)
    end
  end

  def show_result
    puts ""
    puts "Player score: #{player.total}"
    puts "Dealer score: #{dealer.total}"
    puts ""
    puts "Players cards: "
    player.show_all_cards
    puts ""
    puts "Dealers cards: "
    dealer.show_all_cards
    puts ""
  end
end

Game.new.start
