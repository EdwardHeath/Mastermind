# Mastermind
class Game
  def initialize
    @max_turns = 12
    @current_turn = 1
    @colors = 6
    @solution = Array.new(4) { rand(1..@colors) }.join('')
  end

  def guess
    print 'Enter 4 digit guess between 1 and 6: '
    player_guess = gets.chomp.to_i
    until player_guess.between?(1111, 10_000)
      print "Invalid guess. Enter 4 digit guess between 1 and #{@colors}: "
      player_guess = gets.chomp.to_i
    end
    @current_turn += 1
    player_guess.to_s
  end

  def check_guess
    if @player_guess == @solution
      game_over('win')
    else
      feedback
    end
  end

  def game_over(status)
    if status == 'win'
      puts 'Correct! Game Over!'
      exit
    elsif status == 'lose'
      puts 'No more turns! Game Over!'
    end
  end

  def feedback
    feedback_str = ''
    @player_guess.split('').each_with_index do |num, index|
      feedback_str << if @solution[index] == num
                        '1'
                      elsif @solution.include?(num) &&
                            (@solution.count(num) <= @player_guess.count(num))
                        '0'
                      else
                        '-'
                      end
    end
    puts feedback_str.chars.sort.reverse.join
  end

  def play
    puts @solution.inspect
    while @current_turn <= @max_turns
      @player_guess = guess
      check_guess
    end
    game_over('lose')
  end
end

game = Game.new
game.play
