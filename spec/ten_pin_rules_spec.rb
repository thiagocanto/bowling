require_relative './test_helpers'
require_relative '../src/rules/ten_pin_rules'

RSpec.describe TenPinRules do
  context 'having correct values' do
    scores = %w[8 2 7 3 3 4 10 2 8 10 10 8 0 10 8 2 9]
    turns = TenPinRules.organize_turns scores

    it 'should locate correct rounds' do
      expect(turns.size).to eq 10
    end

    it 'should group plays' do
      expect(turns).to eq [%w[8 2], %w[7 3], %w[3 4], %w[10], %w[2 8], %w[10], %w[10], %w[8 0], %w[10], %w[8 2 9]]
    end

    it 'should correctly calculate each step score' do
      expect(TenPinRules.calculate_scores(scores)).to eq [17, 13, 7, 20, 20, 28, 18, 8, 20, 19]
    end
  end

  context 'having invalid scores' do
    it "shouldn't run with negative values" do
      players = generate_players(%w[John], [%w[-8 5]])
      expect(TenPinRules.valid_chances?(players)).to eq false
    end

    it "shouldn't run with values greater than 10" do
      players = generate_players(%w[John], [%w[15 7 3 6 8]])
      expect(TenPinRules.valid_chances?(players)).to eq false
    end
  end

  context 'having a perfect game' do
    turns = TenPinRules.organize_turns %w[10 10 10 10 10 10 10 10 10 10 10 10]

    it 'should group plays' do
      expect(turns).to eq [%w[10], %w[10], %w[10], %w[10], %w[10], %w[10], %w[10], %w[10], %w[10], %w[10 10 10]]
    end
  end
end
