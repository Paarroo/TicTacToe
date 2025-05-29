# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib/app', __dir__)
require 'board'
require 'board_cases'
require 'player'
require 'game'

players = Player.create_players
Player.round(players)

# board = Board.new
# board.display_grid
