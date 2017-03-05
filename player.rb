class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_player_position_selection

    loop{
      selected_position = gets.chomp
      if(selected_position.size == 1 && selected_position.scan(/[1-9]/).size != 0)
        return selected_position.to_i
      else
        puts "Sorry the value has to be a number between 1-9"
        print "Try again: "
      end
    }

  end

end
