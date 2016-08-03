class Game
  
  class Player < Struct.new(:name)
    FIRST = "First"
    SECOND = "Second"

    def to_s
      name
    end
  end

  def initialize
    @players = [Player.new(Player::FIRST), Player.new(Player::SECOND)]
  end

  def current_player(turn)
    @players[turn%2]
  end

  def take_turn(stones, turn)
    @memo ||= {  }
    @memo["#{stones}-#{turn}"] ||= play(stones, turn)
  end

  def play(stones, turn = 0)
    player = current_player(turn).name
    
    [5,3,2].each do |_play|
      stones_left =  stones - _play
      if stones_left > 0
        winner = take_turn(stones_left, turn + 1)
        return winner if winner == player
      elsif stones_left == 0
        return player
      end
    end
    # no possible_moves. Other player wins
    current_player(turn + 1).name
  end
end
