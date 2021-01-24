require 'test/unit'
require_relative '../loader'

# Test for Game class
class TestLoader < Test::Unit::TestCase
  def setup
    @data = ['Jeff 10', 'John 3', 'John 7', 'Fred 4', 'Fred 0']
  end

  def test_should_return_players
    players = Loader.extract_players @data

    assert players.size == 3, "Didn't extracted as expected: #{players}"
    assert players == %w[Jeff John Fred]
  end

  def test_should_return_scores
    scores = Loader.extract_points_for_players(@data, Loader.extract_players(@data))

    assert scores.size == 3, "Didn't return score for every player: #{scores}"
    assert scores == [%w[10], %w[3 7], %w[4 0]], "Returned values are wrong #{scores}"
  end
end
