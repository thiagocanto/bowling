require_relative './test_helpers'
require_relative '../src/game'
require_relative '../src/rules/ten_pin_rules'

# Test for Game class
RSpec.describe Game do
  players = generate_players(%w[John Fred Mance Steve],
    [
      %w[10 7 0 F 5 8 2 10 10 0 9 4 6 10 4 6 10],
      %w[8 2 7 3 5 0 F 8 10 7 2 8 0 10 7 3 9 1 8],
      %w[8 0 8 2 4 5 5 5 10 10 8 0 10 9 1 10 10 5],
      %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 8 2 9]
    ])

  game = Game.new(players, TenPinRules)

  it 'should validate amount of players and chances received' do
    expect(game.valid_data?).to eq true
  end

  it "shouldn't work with non-matching players and chances" do
    players = generate_players(%w[John Fred],
      [
        %w[10 10 10 10 10 10 10 10 10 10 10]
      ])
    game = Game.new(players, TenPinRules)

    expect(game.valid_data?).to eq false
  end
end
