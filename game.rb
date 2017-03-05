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
    puts "Lets Play Tic Tac Toe!"
    Game.print_divider

    round = 1
    new_round = false
    @current_player = @Player1
    current_symbol = Board.X_SYMBOL

    loop {
      Game.print_divider
      puts "Round #{round}: Your turn #{@current_player.name} (#{current_symbol})"
      @Game_Board.print_board

      play_round(current_symbol)

      break if end_game?

      @current_player = @current_player == @Player1 ? @Player2 : @Player1
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

  def play_round(current_symbol)
    loop{
      print "Select a square: "
      player_selection = @current_player.get_player_position_selection - 1
      if(!@Game_Board.make_move(current_symbol, player_selection / 3, player_selection % 3))
        puts "Sorry #{player_selection + 1} is not free. Please try again"
      else
        break;
      end
      @Game_Board.print_board
    }
  end

  def end_game?

    if(@Game_Board.win?)
      print_game_won_message
      @Game_Board.print_board
      return true
    elsif(!@Game_Board.free_space_on_board?)
      print_full_board_message
      @Game_Board.print_board
      return true
    end
    return false
  end

  def run_ai_player_round(current_player, current_symbol)

    @current_player.ai_selected_position(@Game_Board, current_symbol)

    @Game_Board.print_board
  end

  def print_game_won_message
    puts "Congratulations #{@current_player.name}. You Win!"
  end

  def print_full_board_message
    puts "The game board is full. No one wins"
  end

end
