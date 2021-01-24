require './loader'
require './game'

file = nil
ARGV.each do |arg|
  file = arg.gsub('file=', '') if arg.include?('file=')
end

raise "A score file should be provided using 'file=' argument" if file.nil?
raise "File #{file} not found" unless File.exist?(file)

game_plays = File.read('scores.txt').split("\n")
players = Loader.extract_players(game_plays)

Game.new(players, Loader.extract_points_for_players(game_plays, players))
