# encoding: utf-8

require 'minitest/autorun'

def compare(poker_hands)

end

describe 'parse_poker_hands' do

end

describe 'Poker hands' do
  describe "Suggested test cases" do
    it "White wins with high card: Ace" do
      compare("Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH").must_equal "White wins. - with high card: Ace"
    end

    it "White wins with flush" do
      compare("Black: 2H 4S 4C 2D 4H White: 2S 8S AS QS 3S").must_equal "White wins. - with flash"
    end

    it "Black wins with high card: 9" do
      compare("Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C KH").must_equal "Black wins. - with high card: 9"
    end

    it "nobody wins" do
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
