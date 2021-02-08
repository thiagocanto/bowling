# Class to keep track of each player data and scores
class Player
  attr_reader :name, :chances

  def initialize(name, chances = [])
    @name = name
    @chances = chances

    validate
  end

  def validate
    raise StandardError, 'Player has no chances registered' if @chances.nil?
    raise StandardError, "Player score can't have negatives" if @chances.any? { |chance| chance.to_i.negative? }
  end

  def turns(rules)
    rules.organize_turns(@chances)
  end

  def partial_scores(rules)
    rules.calculate_scores(@chances)
  end

  def scores(rules)
    scores = []
    partial_scores = partial_scores(rules)

    (0..partial_scores.size - 1).each do |i|
      scores << partial_scores[0..i].reduce(:+)
    end

    scores
  end

  def final_score(rules)
    partial_scores(rules).reduce(:+)
  end
end
