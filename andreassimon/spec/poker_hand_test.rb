# encoding: utf-8

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))


require 'minitest/reporters'
MiniTest::Reporters.use!
require 'minitest/autorun'

require 'poker_game'

def card(card_code)
  PokerCard.new(card_code)
end

describe PokerHands::PokerHand do
  it "consists of five different #{PokerCard}s" do
    poker_hand = PokerHands::PokerHand.new(*%w(2H 3H 4H 5H 6H))
  end

  describe '#cards' do
    it "returns an array of 5 #{PokerCard}s" do
      poker_hand = PokerHands::PokerHand.new(*%w(2H 3H 4H 5H 6H))

      poker_hand.cards.must_equal([card('2H'), card('3H'), card('4H'), card('5H'), card('6H')])
    end
  end
end
