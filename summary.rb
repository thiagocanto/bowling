# Class responsible for displaying game info
class Summary
  def initialize() end

  def self.display_header
    puts %w[Frame 1 2 3 4 5 6 7 8 9 10].join("\t\t")
  end

  def self.display_score(score_data)
    score_data.join("\t\t")
  end

  def self.display_pinfalls(pinfalls)
    pinfalls.map do |pinfall|
      if pinfall.size == 1
        ["\s", 'X']
      elsif pinfall.map(&:to_i).sum == 10
        [pinfall[0], '/']
      elsif pinfall.size == 3
        pinfall[2] = '/' if pinfall[0] == '10' && pinfall.map(&:to_i).reject { |i| i == 10 }.sum >= 10
        pinfall[1] = '/' if pinfall[0] != '10' && pinfall.map(&:to_i).reject { |a| a == 10 }.sum >= 10

        pinfall
          .map { |value| value.to_i == 10 ? 'X' : value }
      else
        pinfall
      end
    end.join("\t")
  end
end
