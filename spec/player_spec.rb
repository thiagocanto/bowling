require_relative '../src/models/player'
require_relative '../src/rules/ten_pin_rules'

RSpec.describe Player do
  context 'having correct values' do
    player = Player.new 'Steve', %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 8 2 9]

    it 'should calculate round scores' do
      expect(player.scores(TenPinRules)).to eq [17, 30, 37, 57, 77, 105, 123, 131, 151, 170]
    end

    it 'should calculate total score' do
      expect(player.final_score(TenPinRules)).to eq 170
    end
  end

  context 'having a perfect game' do
    it 'should get max score' do
      player = Player.new 'Awesome bowler', %w[10 10 10 10 10 10 10 10 10 10 10 10]
      expect(player.final_score(TenPinRules)).to eq 300
    end
  end

  context 'having a lame game' do
    it 'should get minimum score' do
      player = Player.new 'Lame bowler', %w[0 0 0 0 0 0 0 0 0 0 0]
      expect(player.final_score(TenPinRules)).to eq 0
    end
  end
end
