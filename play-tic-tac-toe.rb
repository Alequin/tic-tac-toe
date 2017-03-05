require_relative 'game'

loop{
  Game.print_divider
  puts "Welcome to Noughts and Crosses"
  Game.print_divider
  puts "What would you like to do?"
  puts %q{1: Play
2: Exit game
    }
  case gets.chomp
  when "1"

    puts "Player 1: What is your name?"
    player1 = Player.new(gets.chomp)
    puts "Player 2: What is your name?"
    player2 = Player.new(gets.chomp)

    Game.new(player1, player2).run_game_loop
  when "2"
      puts "See you next time!"
      break;
  else
    puts "Sorry that input was not valid. Try 1 or 2."
  end
}
