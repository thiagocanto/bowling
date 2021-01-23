require './Game'

file = nil
ARGV.each do |arg|
  file = arg.gsub('file=', '') if arg.include?('file=')
end

raise "A score file should be provided using 'file=' argument" if file.nil?

game_source = File.read('scores.txt').split
puts game_source
