class Board
  def initialize
    @cases = {}
    (1..9).each do |i|
      case_id = i.to_s
      @cases[case_id] = ' '
    end
  end

  def display_grid
    puts " #{@cases['1'] == ' ' ? '1' : @cases['1']} | #{@cases['2'] == ' ' ? '2' : @cases['2']} | #{@cases['3'] == ' ' ? '3' : @cases['3']} "
    puts '-----------'
    puts " #{@cases['4'] == ' ' ? '4' : @cases['4']} | #{@cases['5'] == ' ' ? '5' : @cases['5']} | #{@cases['6'] == ' ' ? '6' : @cases['6']} "
    puts '-----------'
    puts " #{@cases['7'] == ' ' ? '7' : @cases['7']} | #{@cases['8'] == ' ' ? '8' : @cases['8']} | #{@cases['9'] == ' ' ? '9' : @cases['9']} "
  end

  def place_symbol(position, symbol)
    if @cases[position.to_s] == ' '
      @cases[position.to_s] = symbol
      true
    else
      false
    end
  end
end
