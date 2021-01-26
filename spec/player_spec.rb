require_relative '../player'
require_relative '../ten_pin_rules'

RSpec.describe Player do
  context 'having correct values' do
    player = Player.new 'Steve', TenPinRules, %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 8 2 9]

    it 'should correctly calculate each step score' do
      expect(player.partial_scores).to eq [17, 13, 7, 20, 20, 28, 18, 8, 20, 19]
    end

    it 'should calculate round scores' do
      expect(player.round_scores).to eq [17, 30, 37, 57, 77, 105, 123, 131, 151, 170]
    end

    it 'should calculate total score' do
      expect(player.final_score).to eq 170
    end
  end

  context 'having a perfect game' do
    it 'should get max score' do
      player = Player.new 'Awesome bowler', TenPinRules, %w[10 10 10 10 10 10 10 10 10 10 10 10]
      expect(player.final_score).to eq 300
    end
  end

  context 'having a lame game' do
    it 'should get minimum score' do
      player = Player.new 'Lame bowler', TenPinRules, %w[0 0 0 0 0 0 0 0 0 0 0]
      expect(player.final_score).to eq 0
    end
  end
end
