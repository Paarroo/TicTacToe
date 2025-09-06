# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def self.create_players
    players = []

    # Collect player names first
    2.times do |i|
      puts "Player #{i + 1}, what is your name ?"
      print '> '
      input = gets
      name = input ? input.chomp : "Player#{i + 1}"
      players << Player.new(name, nil)  # Symbol assigned later
    end

    # Randomly assign symbols using optimal shuffle method
    symbols = ['🌚', '🌝'].shuffle
    players.each_with_index do |player, i|
      player.symbol = symbols[i]
      puts "#{player.name} plays with #{player.symbol}! 🎯"
    end
    
    players
  end
end
