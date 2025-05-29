# frozen_string_literal: true

#  cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.
# Variables d'instance : tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations annexes comme "quel joueur doit jouer ?", "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.
# Méthodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), s'occupe de finir la partie si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.
require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'application'
require 'player'
require 'board'

player1 = Player.new('Robert')
player2 = Player.new('Jasmine')

player1.get_symbol
player2.get_symbol

board = Board.new
puts board.plateau

plateau = board.plateau
plateau.each { |bloc| print bloc.name }
puts ''

board.play_turn1(player1)
# board.play_turn(player1)
