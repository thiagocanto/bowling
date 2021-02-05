# Class to keep track of each player data and scores
class Player
  attr_reader :name, :chances

  def initialize(name, chances = [])
    @name = name
    @chances = chances
  end

  def turns(rules)
    rules.organize_turns(@chances)
  end

  def scores(rules)
    scores = []
    partial_scores = rules.calculate_scores(@chances)

    (0..partial_scores.size - 1).each do |i|
      scores << partial_scores[0..i].reduce(:+)
    end

    scores
  end

  def final_score
    partial_scores.reduce(:+)
  end
end
