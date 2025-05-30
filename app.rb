# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib/app', __dir__)
require 'board'
require 'player'
require 'game'

puts '🎮 === TIC TAC TOE === 🎮'
puts 'Welcome to tic-tac-toe'
puts "Boxes are numbered from 1 to 9
  the purpose of the game is to line up 3 symbols"

game = Game.new
game.play

puts ''
puts "Merci d'avoir joué ! 👋"
