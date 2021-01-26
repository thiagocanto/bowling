# Class responsible for displaying game info
class Summary
  def initialize() end

  def self.display_header
    puts %w[Frame 1 2 3 4 5 6 7 8 9 10].join("\t\t")
  end

  def self.display_score(score_data)
    puts "Displaying score: #{score_data}"

    puts 'throws:'
    turns.map.with_index do |turn, i|
      puts "#{i}: #{turn.inspect}"
      # puts "will show: #{[first_throw, second_throw, third_throw].join("\t").inspect}"
      turn
    end
  end
end
