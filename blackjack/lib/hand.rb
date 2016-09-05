class Hand
  require_relative "card"
  require_relative "deck"

  attr_accessor :hand
  attr_reader :score

  def initialize
    @hand = []
    @score = 0
  end

  def show_cards
    @hand.flatten!
    @hand.each do |card|
      puts "you have a #{card.rank} of #{card.suit}"
    end
    self.calculate_score
  end

  def show_cards_comp
    @hand.flatten!
    @hand.each do |card|
      puts "The dealer has a #{card.rank} of #{card.suit}"
    end
    self.calculate_score
  end

  def calculate_score
    @score = 0

    @hand.flatten!

    @hand.each do |card|
      if card.facecard?
        @score += 10
      elsif card.ace?
        if @score <= 10
          @score += 11
        else
          @score += 1
        end
      else
        @score += card.rank
      end
    end
    puts "Score: #{@score}"
  end
end
