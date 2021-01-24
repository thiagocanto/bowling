# Main game class
class Game
  def initialize(players, scores = [])
    @players = players
    puts @players
    puts scores

    summary
  end

  def summary
    puts 'Game summary!'
  end
end
