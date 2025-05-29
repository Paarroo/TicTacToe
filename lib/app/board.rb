class Board
  def initialize
    @cases = {}
    (1..9).each do |i|
      case_id = i.to_s
      @cases[case_id] = ' '
    end
  end

  def display_grid

    puts " #{@cases['1']} | #{@cases['2']} | #{@cases['3']} "
    puts '-----------'
    puts " #{@cases['4']} | #{@cases['5']} | #{@cases['6']} "
    puts '-----------'
    puts " #{@cases['7']} | #{@cases['8']} | #{@cases['9']} "
    while @cases['i']==' '
      @casrs = i
      else symbol

      end


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
