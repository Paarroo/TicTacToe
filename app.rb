# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib/app', __dir__)
require 'board'
require 'player'
require 'game'
require 'ui'

class TicTacToeApp
  def initialize
    @running = true
  end

  def start
    UI.clear_screen
    UI.welcome_banner
    UI.press_enter_to_continue
    
    while @running
      UI.clear_screen
      UI.main_menu
      handle_main_menu_choice
    end
    
    UI.goodbye
  end

  private

  def handle_main_menu_choice
    choice = get_menu_choice(1, 3)
    
    case choice
    when 1
      play_game
    when 2
      show_rules
    when 3
      @running = false
    end
  end

  def play_game
    UI.clear_screen
    game = Game.new
    result = game.play
    
    UI.press_enter_to_continue
    handle_game_over_menu
  end

  def show_rules
    UI.clear_screen
    UI.show_rules
    UI.press_enter_to_continue
  end

  def handle_game_over_menu
    loop do
      UI.clear_screen
      UI.game_over_menu
      choice = get_menu_choice(1, 3)
      
      case choice
      when 1
        play_game
        return
      when 2
        return # Back to main menu
      when 3
        @running = false
        return
      end
    end
  end

  def get_menu_choice(min, max)
    loop do
      input = gets
      return 3 if input.nil? # Exit gracefully if no input
      input = input.chomp
      
      if input.match?(/\A\d+\z/)
        choice = input.to_i
        if choice.between?(min, max)
          return choice
        end
      end
      
      puts "💢 " + "Please enter a number between #{min}-#{max}!".red
      print "> ".bold
    end
  end
end

# Start the application
app = TicTacToeApp.new
app.start
