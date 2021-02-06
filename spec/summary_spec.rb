require_relative '../src/rules/ten_pin_rules'
require_relative '../src/views/summary'

# Test for Game class
RSpec.describe Summary do
  context 'in a normal game' do
    chances = %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 8 2 9]

    it 'should print header for all rounds' do
      expect(Summary.display_header(TenPinRules.organize_turns(chances).size))
        .to eq "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10"
    end

    it 'should print info with correct characters' do
      expect(Summary.display_pinfalls(TenPinRules.organize_turns(chances)))
        .to eq %w[8 / 7 / 3 4 \s X 2 / \s X \s X 8 0 \s X 8 / 9]
        .join("\t").gsub('\\s', "\s")
    end
  end

  context 'in a perfect game' do
    chances = %w[10 10 10 10 10 10 10 10 10 10 10 10]
    it 'should print all Xs' do
      expect(Summary.display_pinfalls(TenPinRules.organize_turns(chances)))
        .to eq %w[\s X \s X \s X \s X \s X \s X \s X \s X \s X X X X]
        .join("\t").gsub('\\s', "\s")
    end
  end

  context 'in last round strike' do
    chances = %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 10 1 9]

    it 'should correctly print final round' do
      expect(Summary.display_pinfalls(TenPinRules.organize_turns(chances)))
        .to eq %w[8 / 7 / 3 4 \s X 2 / \s X \s X 8 0 \s X X 1 /]
        .join("\t").gsub('\\s', "\s")
    end
  end
end
