# frozen_string_literal: true

class Player
  attr_accessor :name_player, :nb_player

  def initialize
    @nb_player = nb_player_array << gets.chomp.to_i
    @name_player = name_player_array << gets.chomp.to_i
  end

  def round(_player_x)
    @nb_player.each do |i, @name_player|
      puts "gets player #{i+1} name"
    end
  end

  def method_name(args); end
end
