require_relative 'board'
require_relative 'player'

class Game

  def initialize(player1, player2)
    @Player1 = player1
    @Player2 = player2
    @Game_Board = Board.new
  end

  def run_game_loop

    Game.print_divider
    puts "Lets Play Noughts and Crosses!"
    Game.print_divider

    round = 1
    new_round = false
    current_player = @Player1
    current_symbol = Board.X_SYMBOL

    loop {
      Game.print_divider
      puts "Round #{round}: Your turn #{current_player.name} (#{current_symbol})"
      @Game_Board.print_board
      loop{
        print "Select a square: "
        player_selection = (get_player_position_selection.to_i) - 1
        if(!@Game_Board.make_move(current_symbol, player_selection / 3, player_selection % 3))
          puts "Sorry #{player_selection + 1} is not free. Please try again"
        else
          break;
        end
        @Game_Board.print_board
      }

      if(@Game_Board.win?)
        print_game_won_message(current_player.name)
        @Game_Board.print_board
        break;
      elsif(!@Game_Board.free_space_on_board?)
        print_full_board_message
        @Game_Board.print_board
        break;
      end

      current_player = current_player == @Player1 ? @Player2 : @Player1
      current_symbol = current_symbol == Board.X_SYMBOL ? Board.O_SYMBOL : Board.X_SYMBOL
      if(new_round)
       round += 1
      end
      new_round = !new_round
    }

  end

  def Game.print_divider
    puts "-----------------------------------------------------------------"
  end

  private

  def get_player_position_selection

    error_message =

    loop{
      selected_position = gets.chomp
      if(selected_position.size == 1 && selected_position.scan(/[1-9]/).size != 0)
        return selected_position
      else
        puts "Sorry the value has to be a number between 1-9"
        print "Try again: "
      end
    }

  end

  def print_game_won_message(name_of_winner)
    puts "Congratulations #{name_of_winner}. You Win!"
  end

  def print_full_board_message
    puts "The game board is full. No one wins"
  end

end
