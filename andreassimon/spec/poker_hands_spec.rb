# encoding: utf-8

require 'minitest/autorun'

def compare(poker_hands)

end

def parse_poker_hands(poker_hands)
  card_regex = '([2-9TJQKA][CDHS])'
  poker_hand_regex = ([card_regex] * 5).join ' '
  black_cards = /Black: #{poker_hand_regex}/.match(poker_hands)[1..5]
  white_cards = /White: #{poker_hand_regex}/.match(poker_hands)[1..5]
  {
    black: black_cards,
    white: white_cards
  }
end

describe 'parse_poker_hands' do
  let(:poker_hands) { "Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH" }
  let(:parse_result) { parse_poker_hands(poker_hands) }

  it "returns a list of cards for Black" do
    parse_result[:black].must_equal %w(2H 3D 5S 9C KD)
  end

  it "returns a list of cards for White" do
    parse_result[:white].must_equal %w(2C 3H 4S 8C AH)
  end

end

class PokerCard
  CLUBS = 'C'
  DIAMONDS = 'D'
  HEARTS = 'H'
  SPADES = 'S'

  VALUE_2 = '2'
  VALUE_3 = '3'
  VALUE_4 = '4'
  VALUE_5 = '5'
  VALUE_6 = '6'
  VALUE_7 = '7'
  VALUE_8 = '8'
  VALUE_9 = '9'
  VALUE_10 = 'T'
  VALUE_JACK  = 'J'
  VALUE_QUEEN = 'Q'
  VALUE_KING  = 'K'
  VALUE_ACE   = 'A'

  def initialize(value_and_suit)
    @value, @suit = value_and_suit[0], value_and_suit[1]
  end

  attr_reader :value, :suit
end

describe PokerCard do
  describe '##new' do

  end

  describe '#suit' do
    it 'can be clubs' do
      two_of_clubs = PokerCard.new '2C'

      two_of_clubs.suit.must_equal PokerCard::CLUBS
    end

    it 'can be diamonds' do
      two_of_diamonds = PokerCard.new '2D'

      two_of_diamonds.suit.must_equal PokerCard::DIAMONDS
    end

    it 'can be hearts' do
      two_of_hearts = PokerCard.new '2H'

      two_of_hearts.suit.must_equal PokerCard::HEARTS
    end

    it 'can be spades' do
      two_of_spades = PokerCard.new '2S'

      two_of_spades.suit.must_equal PokerCard::SPADES
    end

  end

  describe '#value' do
    it 'can be *2*' do
      two_of_clubs = PokerCard.new '2C'

      two_of_clubs.value.must_equal PokerCard::VALUE_2
    end

    # 3..8 skipped

    it 'can be *9*' do
      nine_of_clubs = PokerCard.new '9C'

      nine_of_clubs.value.must_equal PokerCard::VALUE_9
    end

    it 'can be *ten*' do
      ten_of_clubs = PokerCard.new 'TC'

      ten_of_clubs.value.must_equal PokerCard::VALUE_10
    end

    it 'can be *jack*' do
      jack_of_clubs = PokerCard.new 'JC'

      jack_of_clubs.value.must_equal PokerCard::VALUE_JACK
    end

    it 'can be *queen*' do
      queen_of_clubs = PokerCard.new 'QC'

      queen_of_clubs.value.must_equal PokerCard::VALUE_QUEEN
    end

    it 'can be *king*' do
      king_of_clubs = PokerCard.new 'KC'

      king_of_clubs.value.must_equal PokerCard::VALUE_KING
    end

    it 'can be *ace*' do
      ace_of_clubs = PokerCard.new 'AC'

      ace_of_clubs.value.must_equal PokerCard::VALUE_ACE
    end
  end
end

describe 'Poker hands' do
  describe "Suggested test cases" do
    it "White wins with high card: Ace" do
      skip
      compare("Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH").must_equal "White wins. - with high card: Ace"
    end

    it "White wins with flush" do
      skip
      compare("Black: 2H 4S 4C 2D 4H White: 2S 8S AS QS 3S").must_equal "White wins. - with flash"
    end

    it "Black wins with high card: 9" do
      skip
      compare("Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C KH").must_equal "Black wins. - with high card: 9"
    end

    it "nobody wins" do
      skip
      compare("Black: 2H 3D 5S 9C KD White: 2D 3H 5C 9S KH").must_equal "Tie."
    end
  end
  
  describe 'high card' do

  end

  describe 'pair' do
    it 'is ranked higher than a high card'
  end

  describe 'two pairs' do
  end

  describe 'three of a kind' do
  end

  describe 'straight' do
  end

  describe 'flush' do
  end

  describe 'full house' do
  end

  describe 'four of a kind' do
  end

  describe 'straight flush' do
  end
end
