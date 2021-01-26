# Class to keep track of each player data and scores
class Player
  attr_reader :name, :chances

  def initialize(name, chances = [], rounds: 10, pins: 10, balls: 2)
    @name = name
    @chances = chances
    @rounds = rounds
    @pins = pins
    @balls = balls
  end

  def valid_chances?
    @chances
      .none? { |chance| chance.to_i.negative? || chance.to_i > @pins }
  end

  def next_round?(ball:, dropped_pins:, round:)
    (round != @rounds - 1) && (ball >= @balls || dropped_pins >= @pins)
  end

  def turns
    scores = []
    ball = 0
    round = 0
    @chances.each.with_index do |chance, i|
      scores[round] = [] if scores[round].nil?
      scores[round] << @chances[i]

      ball += 1

      if next_round?({ ball: ball, dropped_pins: chance.to_i, round: round })
        ball = 0
        round += 1
      end
    end
    scores
  end

  def partial_scores
    chance_index = 0
    turns.map.with_index do |turn, i|
      chance_index += turn.size
      extra = turn_extra_value(turn_type(turn.map(&:to_i).sum, turn.size), chance_index)

      turn.map(&:to_i).sum + extra
    end
  end

  def turn_extra_value(turn_type, chance_index)
    # puts "Received #{turn_type} at #{chance_index}"
    case turn_type
    when :strike
      @chances[chance_index].to_i + @chances[chance_index + 1].to_i
    when :spare
      @chances[chance_index].to_i
    else
      0
    end
  end

  def turn_type(score, balls)
    return :strike if balls == 1
    return :spare if score == @pins
    return :final if balls == 3

    :normal
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
