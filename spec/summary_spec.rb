require_relative '../player'
require_relative '../summary'

# Test for Game class
RSpec.describe Summary do
  context 'in a normal game' do
    player = Player.new('Steve', %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 8 2 9])

    it 'should print info with correct characters' do
      expect(Summary.display_pinfalls(player.turns)).to eq %w[8 / 7 / 3 4 \s X 2 / \s X \s X 8 0 \s X 8 / 9]
        .join("\t").gsub('\\s', "\s")
    end
  end

  context 'in a perfect game' do
    player = Player.new('Pro', %w[10 10 10 10 10 10 10 10 10 10 10 10])
    it 'should print all Xs' do
      expect(Summary.display_pinfalls(player.turns)).to eq %w[\s X \s X \s X \s X \s X \s X \s X \s X \s X X X X]
        .join("\t").gsub('\\s', "\s")
    end
  end

  context 'in last round strike' do
    player = Player.new('Steve', %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 10 1 9])

    it 'should correctly print final round' do
      expect(Summary.display_pinfalls(player.turns)).to eq %w[8 / 7 / 3 4 \s X 2 / \s X \s X 8 0 \s X X 1 /]
        .join("\t").gsub('\\s', "\s")
    end
  end
end
