require_relative "deck"
require_relative "hand"
require 'pry'
class Blackjack

  def initialize
    @player = Hand.new
    @computer = Hand.new
    @deck = Deck.new
    @answer = ''
  end

  def deal
    @player.hand << @deck.deal(1)
    puts "player was dealt a card"
    @computer.hand << @deck.deal(1)
    puts "dealer was dealt a card"
    @player.hand << @deck.deal(1)
    puts "player was dealt a card"
    @computer.hand << @deck.deal(1)
    puts "dealer was dealt a card"
  end

  def dealer_show
    puts "Dealer:"
    @computer.show_cards
  end

  def player_cards
    @player.show_cards
  end

  def dealer_minimum
    while @computer.score < 17
      @computer.hand << @deck.deal(1)
      puts "dealer hits"
      dealer_show
    end
  end

  def measure_player_score
    while @player.score < 21 && @answer != 'hit' || @answer != 'stand'
      puts "Would you like to hit or stand? (hit/stand)"
      @answer = gets.chomp
      if @answer == 'hit'
        @player.hand << @deck.deal(1)
        puts "Player was dealt a card"
        player_cards
        if @player.score > 21
          dealer_show
          puts "Dealer wins with #{@computer.score}. You busted."
          break
        end
      elsif @answer == 'stand'
        puts "You chose to stand with #{@player.score}"
        dealer_minimum
        calculate_final
        break
      end
    end
  end


  def calculate_final
    if @player.score == 21 && @computer.score != 21
      puts "21! Blackjack! You win!"
    elsif @player.score != 21 && @computer.score == 21
      puts "Dealer hits 21! Blackjack! You lose!"
    elsif @player.score < @computer.score && @computer.score < 21
      puts "The dealer wins with #{@computer.score}"
    elsif @player.score < 21 && @computer.score > 21
      puts "You win! the dealer busted with #{@computer.score}"
    elsif @player.score > @computer.score && @player.score < 21
      puts "You win! You beat the dealer with #{@player.score} over their #{@computer.score}"
    end
  end

  def start_game
    deal
    player_cards
    dealer_show
    measure_player_score
  end
end

game = Blackjack.new
game.start_game
