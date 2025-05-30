# frozen_string_literal: true

class Game
  def initialize
    @board = Board.new
    @players = Player.create_players
  end

  def victory
    win = [
      # Lines
      ['1', '2', '3'],
        ['4', '5', '6'],
        ['7', '8', '9'],
        # Columns
        ['1', '4', '7'],
        ['2', '5', '8'],
        ['3', '6', '9'],
        # Diag
        ['1', '5', '9'],
        ['3', '5', '7']
      ]
    win.each do |align|
      values = align.map { |pos| @board.instance_variable_get(:@cases)[pos] }
      if values.uniq.length == 1 && values[0] != ' '
        return values[0] # Return win symb
      end
    end

    nil # no win
  end

  def play
    # player_turn
    @current_player_index = 0

    loop do
      current_player = @players[@current_player_index]
      @board.display_grid
      puts "#{current_player.name}, where do you want to place your symbole #{current_player.symbol} ?"
      position = gets.chomp.to_i

      success = @board.place_symbol(position, current_player.symbol)
      if success
        # Victory_case
          winner_symbol = victory
        if winner_symbol
          @board.display_grid
          winner = @players.find { |player| player.symbol == winner_symbol }
          puts "\n🥳 #{winner.name} wins with #{winner_symbol} ! 🎉"
          break
        end
        @current_player_index = (@current_player_index + 1) % 2
      # = 2 % 2 = 0  → Joueur 1
      # = 1 % 2 = 1 → Joueur 2
      # if @current_player_index == 0 → @current_player_index = 1
      # else → @current_player_index = 0
      else
        puts 'Position already taken! Try again.'

      end
    end
  end
end
