# encoding: utf-8

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))


require 'minitest/reporters'
MiniTest::Reporters.use!
require 'minitest/autorun'

require 'poker_card'


describe PokerCard do
  describe '.initialize()' do
    it "raises an #{ArgumentError} when the parameter's length is more than 2" do
      proc { PokerCard.new 'more than two letters' }.must_raise ArgumentError
    end
  end

  describe '#suit' do
    it 'can be clubs' do
      two_of_clubs = PokerCard.new '2C'

      two_of_clubs.suit.must_equal PokerCard::Suit::CLUBS
    end

    it 'can be diamonds' do
      two_of_diamonds = PokerCard.new '2D'

      two_of_diamonds.suit.must_equal PokerCard::Suit::DIAMONDS
    end

    it 'can be hearts' do
      two_of_hearts = PokerCard.new '2H'

      two_of_hearts.suit.must_equal PokerCard::Suit::HEARTS
    end

    it 'can be spades' do
      two_of_spades = PokerCard.new '2S'

      two_of_spades.suit.must_equal PokerCard::Suit::SPADES
    end

  end

  describe '#value' do
    it 'can be *2*' do
      two_of_clubs = PokerCard.new '2C'

      two_of_clubs.value.must_equal PokerCard::Value::TWO
    end

    # 3..8 skipped

    it 'can be *9*' do
      nine_of_clubs = PokerCard.new '9C'

      nine_of_clubs.value.must_equal PokerCard::Value::NINE
    end

    it 'can be *ten*' do
      ten_of_clubs = PokerCard.new 'TC'

      ten_of_clubs.value.must_equal PokerCard::Value::TEN
    end

    it 'can be *jack*' do
      jack_of_clubs = PokerCard.new 'JC'

      jack_of_clubs.value.must_equal PokerCard::Value::JACK
    end

    it 'can be *queen*' do
      queen_of_clubs = PokerCard.new 'QC'

      queen_of_clubs.value.must_equal PokerCard::Value::QUEEN
    end

    it 'can be *king*' do
      king_of_clubs = PokerCard.new 'KC'

      king_of_clubs.value.must_equal PokerCard::Value::KING
    end

    it 'can be *ace*' do
      ace_of_clubs = PokerCard.new 'AC'

      ace_of_clubs.value.must_equal PokerCard::Value::ACE
    end
  end
end

describe 'poker card order' do
  it "ace is more valuable than king" do
    PokerCard::Value::ACE.must_be :>, PokerCard::Value::KING
  end

  it "ten is more valuable than nine" do
    PokerCard::Value::TEN.must_be :>, PokerCard::Value::NINE
  end
end
