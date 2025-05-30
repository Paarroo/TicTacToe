# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def self.create_players
    players = []
    symbols = ['🌚', '🌝'].shuffle

    2.times do |i|
      puts "Player #{i + 1}, what is your name ?"
      print '> '
      name = gets.chomp
      symbol = symbols.sample
      symbols.delete(symbol)
      players << Player.new(name, symbol)
      puts "#{name} play with #{symbol}"
    end
    players
  end
end
