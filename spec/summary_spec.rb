require_relative '../game'
require_relative '../summary'

# Test for Game class
RSpec.describe Game do
  game = Game.new(
    %w[John Fred Mance Steve],
    [
      %w[10 7 0 F 5 8 2 10 10 0 9 4 6 10 4 6 10],
      %w[8 2 7 3 5 0 F 8 10 7 2 8 0 10 7 3 9 1 8],
      %w[8 0 8 2 4 5 5 5 10 10 8 0 10 9 1 10 10 5]
    ]
  )
end