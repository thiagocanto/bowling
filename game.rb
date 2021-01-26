require './player'
require './summary'

# Main game class
class Game
  def initialize(players, scores)
    @players = players
    @scores = scores
  end

  def valid_data?
    @players.size == @scores.size
  end

  def create_players
    @players
      .to_enum(:each_with_index)
      .map { |player, i| Player.new(player, @scores[i]) }
  end

  def summary
    return 'Sorry, invalid data passed, please validate your file' unless valid_data?

    Summary.display_header
    create_players.each do |player|
      puts player.name
      puts "Pinfalls\t" << player.show_turns.join("\t")
      puts "Score\t\t#{player.partial_scores.join("\t")}"
    end
  end
end
