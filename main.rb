require './src/helpers/loader'
require './src/rules/ten_pin_rules'
require './src/models/player'
require './src/game'

file = nil
ARGV.each do |arg|
  file = arg.gsub('file=', '') if arg.include?('file=')
end

raise "A score file should be provided using 'file=' argument" if file.nil?
raise "File #{file} not found" unless File.exist?(file)

game_plays = File.read(file).split("\n")
players_info = Loader.extract_players(game_plays)
scores = Loader.extract_points_for_players(game_plays, players_info)

players = players_info
          .to_enum(:each_with_index)
          .map { |player, i| Player.new(player, scores[i]) }

game = Game.new(players, TenPinRules)
game.start
