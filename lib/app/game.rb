# frozen_string_literal: true

require_relative 'ui'

class Game
  def initialize
    @board = Board.new
    @players = Player.create_players
  end

  def victory
    winning_combinations = [
      # Rows
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      # Columns
      ['1', '4', '7'],
      ['2', '5', '8'],
      ['3', '6', '9'],
      # Diagonals
      ['1', '5', '9'],
      ['3', '5', '7']
    ]
    
    winning_combinations.each do |combination|
      values = combination.map { |position| @board.get_cell(position) }
      if values.uniq.length == 1 && values[0] != ' '
        return values[0] # Return winning symbol
      end
    end

    nil # No winner
  end

  def play
    @current_player_index = 0

    loop do
      current_player = @players[@current_player_index]
      UI.clear_screen
      @board.display_grid
      UI.current_player_prompt(current_player.name, current_player.symbol)
      
      position = get_valid_position

      # Place symbol (we know it's valid now)
      @board.place_symbol(position, current_player.symbol)
      
      # Check for victory
      winner_symbol = victory
      if winner_symbol
        UI.clear_screen
        @board.display_grid
        winner = @players.find { |player| player.symbol == winner_symbol }
        UI.victory_animation(winner.name, winner.symbol)
        return winner # Return winner for game over menu
      end
      
      # Check for draw
      if @board.board_full?
        UI.clear_screen
        @board.display_grid
        UI.draw_message
        return nil # Return nil for draw
      end
      
      # Switch player
      @current_player_index = (@current_player_index + 1) % 2
    end
  end

  private

  def get_valid_position
    position = nil
    loop do
      print '> '
      input = gets
      return 1 if input.nil? # Default to position 1 if no input
      input = input.chomp
      
      # Check if input is a number
      if input.match?(/\A\d+\z/)
        position = input.to_i
        if @board.valid_position?(position)
          break
        else
          UI.invalid_input_message
        end
      else
        UI.invalid_input_message
      end
    end
    position
  end
end
