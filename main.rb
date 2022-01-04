require_relative './game'

game = Game.new

until game.game_over do
  game.next_turn
end

puts 'Good bye!'
