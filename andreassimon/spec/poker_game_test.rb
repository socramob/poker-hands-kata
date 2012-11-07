# encoding: utf-8

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))


require 'minitest/reporters'
MiniTest::Reporters.use!
require 'minitest/autorun'

require 'poker_card'

def compare(poker_hands)

end

def parse_poker_hands(poker_hands)
  card_regex = '([2-9TJQKA][CDHS])'
  poker_hand_regex = ([card_regex] * 5).join ' '
  black_cards = /Black: #{poker_hand_regex}/.match(poker_hands)
  white_cards = /White: #{poker_hand_regex}/.match(poker_hands)
  raise ArgumentError unless black_cards
  raise ArgumentError unless white_cards
  {
    black: black_cards[1..5],
    white: white_cards[1..5]
  }
end

describe '#parse_poker_hands' do
  let(:poker_hands) { "Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH" }
  let(:parse_result) { parse_poker_hands(poker_hands) }

  it "returns a list of cards for Black" do
    parse_result[:black].must_equal %w(2H 3D 5S 9C KD)
  end

  it "returns a list of cards for White" do
    parse_result[:white].must_equal %w(2C 3H 4S 8C AH)
  end

  describe 'given an empty string' do
    it "raises an ArgumentError" do
      proc { parse_poker_hands('') }.must_raise ArgumentError
    end
  end
end

module PokerHands
  class Pair
    class << self
      def applies_to?(poker_hand)
        sorted_card_values = poker_hand.cards.map(&:value).sort
        (0..3).each do |index|
          return true if sorted_card_values[index] == sorted_card_values[index+1]
        end
        false
      end
    end
  end
end

describe PokerHands::Pair do
  describe '.applies_to?()' do
    it 'returns true when the hand contains at least two cards with the same value' do
      poker_hand_with_two_nines = PokerHands::PokerHand.new *%w(9H 9S 2C 5D TD)

      PokerHands::Pair.applies_to?(poker_hand_with_two_nines).must_equal true
    end

    it 'returns false when the hand does not contain any two cards with the same value' do
      poker_hand_without_two_cards_with_the_same_value = PokerHands::PokerHand.new *%w(9H AS 2C 5D TD)

      PokerHands::Pair.applies_to?(poker_hand_without_two_cards_with_the_same_value).must_equal false
    end
  end

  describe '#to_s' do
    it "contains 'pair' as the type of hand" do
      flunk 'go on here'
    end

    it "contains the duplicate value" do
      flunk 'go on here'
    end
  end

  it 'is ranked higher than a high card'
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
