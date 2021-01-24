# Extract data from raw file and sets it up
# for the game to be started correctly
class Loader
  def self.extract_players(plays)
    plays
      .map { |string| string.split.first }
      .reduce { |memo, name| [*memo].include?(name) ? [*memo] : [*memo, name] }
  end

  def self.extract_points_for_players(plays, players = [])
    players_points = players.map do |player|
      plays
        .select { |play| play.include? player }
        .map { |play| play.split.last }
    end

    players_points
  end
end
