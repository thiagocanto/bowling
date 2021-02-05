require './src/views/summary'

# Main game class
class Game
  def initialize(players, rules)
    @players = players
    @rules = rules
  end

  def valid_data?
    @rules.valid_chances?(@players)
  end

  def add_player(player)
    @players << player
  end

  def start
    raise 'Sorry, invalid data passed, please validate your file' unless valid_data?

    Summary.display(@players, @rules)
  end
end
