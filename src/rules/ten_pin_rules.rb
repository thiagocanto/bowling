# Rules for ten pin bowling
class TenPinRules
  @rounds = 10
  @pins = 10
  @balls = 2

  def self.valid_chances?(players)
    players.all? do |player|
      !player.chances.nil? &&
        player
          .chances
          .none? { |chance| chance.to_i.negative? || chance.to_i > @pins }
    end
  end

  def self.next_round?(ball:, dropped_pins:, round:)
    (round != @rounds - 1) && (ball >= @balls || dropped_pins >= @pins)
  end

  def self.organize_turns(chances)
    scores = []
    ball = 0
    round = 0
    chances.each do |chance|
      scores[round] = [] if scores[round].nil?
      scores[round] << chance

      ball += 1

      if next_round?({ ball: ball, dropped_pins: chance.to_i, round: round })
        ball = 0
        round += 1
      end
    end

    scores
  end

  def self.calculate_scores(chances)
    chance_index = 0

    organize_turns(chances).map do |turn|
      chance_index += turn.size
      extra_points = turn_extra_value(
        turn_type(turn.map(&:to_i).sum, turn.size),
        chances,
        chance_index
      )

      turn.map(&:to_i).sum + extra_points
    end
  end

  def self.turn_extra_value(turn_type, chances, chance_index)
    # puts "Received #{turn_type} at #{chance_index}"
    case turn_type
    when :strike
      chances[chance_index].to_i + chances[chance_index + 1].to_i
    when :spare
      chances[chance_index].to_i
    else
      0
    end
  end

  def self.turn_type(score, balls)
    return :strike if balls == 1
    return :spare if score == @pins
    return :final if balls == 3

    :normal
  end
end
