require_relative 'game'

loop{
  Game.print_divider
  puts "Welcome to Noughts and Crosses"
  Game.print_divider
  puts "What would you like to do?"
  puts %q{1: Player vs Player
2: Player vs AI
3: AI vs AI
4: Exit game
    }
  case gets.chomp
  when "1"

    puts "Player 1: What is your name?"
    player1 = Player.new(gets.chomp, :HUMAN)
    puts "Player 2: What is your name?"
    player2 = Player.new(gets.chomp, :HUMAN)

    Game.new(player1, player2).run_game_loop
  when "2"
  when "3"
  when "4"
    break
  else
    next
  end
}
