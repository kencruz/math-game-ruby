require_relative './player'

class Game
  attr_reader :game_over

  def initialize
    @players = [Player.new, Player.new]
    @turn = 1
    @game_over = false
  end

  def next_turn
    player_turn = 2 - (@turn % 2)
    roll1 = rand(1..20)
    roll2 = rand(1..20)
    puts "Player #{player_turn}: What does #{roll1} plus #{roll2} equal?"
    print '> '
    guess = gets.chomp
    if guess.to_i == roll1 + roll2
      puts "Player #{player_turn}: YES! You are correct."
    else
      puts "Player #{player_turn}: Seriously? No!"
      @players[player_turn - 1].score -= 1
    end

    if @players[player_turn - 1].score.zero?
      winner = (player_turn % 2) + 1
      puts "Player #{winner} wins with a score of #{@players[winner - 1].score}/3"
      puts '----- GAME OVER -----'
      @game_over = true
      return
    end

    puts "P1: #{@players[0].score}/3 vs P2: #{@players[1].score}/3"
    @turn += 1
    puts '----- NEW TURN -----'
  end
end
