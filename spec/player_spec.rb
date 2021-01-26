require_relative '../player'

RSpec.describe Player do
  context 'having correct values' do
    player = Player.new 'Steve', %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 8 2 9]

    it 'should locate correct rounds' do
      expect(player.turns.size).to eq 10
    end

    it 'should group plays' do
      expect(player.turns).to eq [%w[8 2], %w[7 3], %w[3 4], %w[10], %w[2 8], %w[10], %w[10], %w[8 0], %w[10], %w[8 2 9]]
    end

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

  context 'having negative scores' do
    player = Player.new 'Steve', %w[-8 5]

    it "shouldn't run with invalid values" do
      expect(player.valid_chances?).to eq false
    end
  end

  context 'having a perfect game' do
    player = Player.new 'Awesome bowler', %w[10 10 10 10 10 10 10 10 10 10 10 10]

    it 'should get max score' do
      expect(player.final_score).to eq 300
    end
  end
end
