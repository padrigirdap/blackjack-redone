class Card
  attr_reader :suit, :rank

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def facecard?
    if @rank == 'K' || @rank == 'Q' || @rank == 'J'
      return true
    end
  end

  def ace?
    if @rank == 'A'
      return true
    end
  end

end
