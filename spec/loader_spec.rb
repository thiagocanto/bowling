require_relative '../loader'

# Test for Game class
RSpec.describe Loader do
  data = ['Jeff 10', 'John 3', 'John 7', 'Fred 4', 'Fred 0']
  it 'should extract players' do
    players = Loader.extract_players(data)

    expect(players.size).to eq 3
    expect(players).to eq(%w[Jeff John Fred])
  end

  it 'should extract chances' do
    chances = Loader.extract_points_for_players(data, Loader.extract_players(data))

    expect(chances.size).to eq 3
    expect(chances).to eq [%w[10], %w[3 7], %w[4 0]]
  end
end
