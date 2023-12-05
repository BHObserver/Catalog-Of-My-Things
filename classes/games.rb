require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer: false, last_played_at: nil, **item_params)
    super(**item_params)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end


end
