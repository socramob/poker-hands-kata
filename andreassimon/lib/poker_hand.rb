# encoding: utf-8

require 'poker_card'

module PokerHands
  class PokerHand
    def initialize(*cards)
      @cards = *cards.map do |card_code|
        PokerCard.new card_code
      end
    end

    attr_reader :cards
  end
end
