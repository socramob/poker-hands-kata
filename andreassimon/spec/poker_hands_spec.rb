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

  def initialize(suit_and_value)
    @suit = suit_and_value[1]
  end

  attr_reader :suit
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
      two_of_clubs = PokerCard.new '2D'

      two_of_clubs.suit.must_equal PokerCard::DIAMONDS
    end

    it 'can be hearts' do
      two_of_clubs = PokerCard.new '2H'

      two_of_clubs.suit.must_equal PokerCard::HEARTS
    end

    it 'can be spades'
  end

  describe '#value' do
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
