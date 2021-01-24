# Class to keep track of each player data
class Player
  attr_reader :name, :scores

  def initialize(name, scores)
    @name = name
    @scores = scores

    puts inspect
  end
end
