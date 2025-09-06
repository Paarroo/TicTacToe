# frozen_string_literal: true

require 'colorize'

class UI
  def self.welcome_banner
    puts "\n"
    puts "╔══════════════════════════════════════╗".cyan
    puts "║          🎮 TIC TAC TOE 🎮          ║".cyan
    puts "║        The Ultimate Battle!         ║".cyan
    puts "╚══════════════════════════════════════╝".cyan
    puts "\n"
  end

  def self.main_menu
    puts "🎯 " + "MAIN MENU".bold.yellow + " 🎯"
    puts ""
    puts "1️⃣  " + "New Game".green + " - Start a fresh battle!"
    puts "2️⃣  " + "Rules".blue + " - Learn how to play"
    puts "3️⃣  " + "Quit".red + " - Exit the game"
    puts ""
    print "Choose your option (1-3): ".bold
  end

  def self.show_rules
    puts "\n" + "📋 GAME RULES".bold.blue
    puts "=" * 50
    puts "🎯 " + "Objective:".bold + " Be the first to align 3 symbols!"
    puts ""
    puts "🎮 " + "How to play:".bold
    puts "   • Two players take turns"
    puts "   • Place your symbol by entering a number (1-9)"
    puts "   • First to get 3 in a row (horizontal, vertical, diagonal) wins!"
    puts ""
    puts "🌚 🌝 " + "Symbols are assigned randomly!".italic
    puts ""
  end

  def self.victory_animation(winner_name, winner_symbol)
    puts "\n" + "🎉" * 50
    puts ""
    puts "          🏆 " + "VICTORY! ".bold.yellow + "🏆"
    puts ""
    puts "    🥳 " + "#{winner_name}".bold.green + " wins with " + "#{winner_symbol}".bold.magenta + " ! 🎉"
    puts ""
    puts "🎉" * 50
    puts ""
  end

  def self.draw_message
    puts "\n" + "🤝" * 40
    puts ""
    puts "        🤝 " + "IT'S A DRAW!".bold.yellow + " 🤝"
    puts "      " + "Good game both players!".italic.cyan
    puts ""
    puts "🤝" * 40
    puts ""
  end

  def self.game_over_menu
    puts ""
    puts "What would you like to do?".bold
    puts "1️⃣  " + "Play Again".green
    puts "2️⃣  " + "Main Menu".blue
    puts "3️⃣  " + "Quit".red
    puts ""
    print "Your choice (1-3): ".bold
  end

  def self.goodbye
    puts "\n"
    puts "👋 " + "Thanks for playing!".bold.cyan + " 👋"
    puts "See you next time! 🎮".italic.yellow
    puts "\n"
  end

  def self.current_player_prompt(name, symbol)
    puts ""
    puts "🎯 " + "#{name}".bold.green + "'s turn!"
    puts "Place your " + "#{symbol}".bold.magenta + " on the grid (1-9):"
  end

  def self.invalid_input_message
    puts "💢 " + "Invalid input!".red + " Please choose a number between 1-9 for an empty cell."
  end

  def self.position_taken_message
    puts "⚠️  " + "Position already taken!".yellow + " Try a different spot."
  end

  def self.clear_screen
    system('clear') || system('cls')
  end

  def self.press_enter_to_continue
    puts ""
    print "Press " + "ENTER".bold.cyan + " to continue..."
    input = gets
    input&.chomp || ""
  end
end
