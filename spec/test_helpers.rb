require_relative '../src/models/player'

def generate_players(players_arr, scores_arr)
  players_arr
    .to_enum(:each_with_index)
    .map { |player, i| Player.new(player, scores_arr[i]) }
end
