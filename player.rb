# Class to keep track of each player data and scores
class Player
  attr_reader :name, :chances

  def initialize(name, rules, chances = [])
    @name = name
    @rules = rules
    @chances = chances
  end

  def turns
    @rules.organize_turns(@chances)
  end

  def partial_scores
    @rules.calculate_scores(@chances)
  end

  def round_scores
    scores = []
    (0..partial_scores.size - 1).each do |i|
      scores << partial_scores[0..i].reduce(:+)
    end

    scores
  end

  def final_score
    partial_scores.reduce(:+)
  end
end
