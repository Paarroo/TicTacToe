# frozen_string_literal: true

require 'colorize'

class Board
  def initialize
    @cases = {}
    (1..9).each do |i|
      case_id = i.to_s
      @cases[case_id] = ' '
    end
  end

  def display_grid
    puts "\n" + "  🎯 GAME BOARD 🎯".bold.cyan
    puts ""
    puts "     #{format_cell('1')} │ #{format_cell('2')} │ #{format_cell('3')}".light_blue
    puts "   ━━━━━━━━━━━━━━━".light_blue
    puts "     #{format_cell('4')} │ #{format_cell('5')} │ #{format_cell('6')}".light_blue
    puts "   ━━━━━━━━━━━━━━━".light_blue
    puts "     #{format_cell('7')} │ #{format_cell('8')} │ #{format_cell('9')}".light_blue
    puts ""
  end

  def place_symbol(position, symbol)
    if @cases[position.to_s] == ' '
      @cases[position.to_s] = symbol
      true
    else
      false
    end
  end

  def board_full?
    @cases.values.none? { |case_value| case_value == ' ' }
  end

  def valid_position?(position)
    position.between?(1, 9) && @cases[position.to_s] == ' '
  end

  def get_cell(position)
    @cases[position.to_s]
  end

  private

  def format_cell(position)
    cell_value = @cases[position]
    if cell_value == ' '
      position.bold.white
    elsif cell_value == '🌚'
      cell_value.bold.blue
    elsif cell_value == '🌝'
      cell_value.bold.yellow
    else
      cell_value.bold.magenta
    end
  end
end
