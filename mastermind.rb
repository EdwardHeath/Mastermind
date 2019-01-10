# Mastermind
class Game
  def initialize
    @turns = 12
    @colors = 6
    @solution = Array.new(4) { rand(1..@colors) }.join('')
  end

  def guess
    print 'Enter 4 digit guess between 1 and 6: '
    player_guess = gets.chomp.to_i
    until player_guess.between?(1111, 10_000)
      print 'Invalid guess. Enter 4 digit guess between 1 and 6: '
      player_guess = gets.chomp.to_i
    end
    player_guess.to_s
  end

  def check_guess(player_guess)
    puts 'Correct' if player_guess == @solution
  end

  def play
    puts @solution.inspect
    player_guess = guess
    check_guess(player_guess)
  end
end

game = Game.new
game.play
