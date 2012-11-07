# encoding: utf-8

class PokerCard
  class Value
    include Comparable
    @@all_values = Hash.new

    def self.all_values
      @@all_values
    end

    def self.from_symbol(symbol)
      all_values[symbol]
    end

    def initialize(symbol, order = symbol.to_i)
      @symbol, @order = symbol, order
      PokerCard::Value.all_values[symbol] = self
    end

    private_class_method :new

    TWO = new '2'
    THREE = new '3'
    FOUR = new '4'
    FIVE = new '5'
    SIX = new '6'
    SEVEN = new '7'
    EIGHT = new '8'
    NINE = new '9'
    TEN = new 'T', 10
    JACK = new 'J', 11
    QUEEN = new 'Q', 12
    KING = new 'K', 13
    ACE = new 'A', 14

    def to_s
      @symbol.to_s
    end

    def <=>(other)
      @order <=> other.instance_variable_get(:@order)
    end
  end
  class Suit
    private_class_method :new
    @@all_values = Hash.new

    def self.all_values
      @@all_values
    end

    def self.from_symbol(symbol)
      all_values[symbol]
    end

    def initialize(suit_symbol)
      @suit_symbol = suit_symbol
      Suit.all_values[suit_symbol] = self
    end

    CLUBS = new 'C'
    DIAMONDS = new 'D'
    HEARTS = new 'H'
    SPADES = new 'S'

    def to_s
      @suit_symbol
    end
  end

  def initialize(value_and_suit)
    raise ArgumentError, "parameter '#{value_and_suit}' must be 2 letters!" if value_and_suit.size > 2
    @value = PokerCard::Value.from_symbol extract_value(value_and_suit)
    @suit = PokerCard::Suit.from_symbol extract_suit(value_and_suit)
  end

  def extract_suit(value_and_suit)
    value_and_suit[1]
  end

  def extract_value(value_and_suit)
    value_and_suit[0]
  end

  attr_reader :value, :suit

  def to_s
    value.to_s + suit.to_s
  end

  def ==(other)
    value == other.value &&
      suit == other.suit
  end
end
