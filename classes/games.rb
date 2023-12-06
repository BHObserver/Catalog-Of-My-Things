require 'active_support/all'
require './classes/author'
require './classes/item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer:, last_played_at:, publish_date: nil, archived: false)
    super(publish_date: publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && years_since_last_played > 2
  end

  private

  def years_since_last_played
    Time.current.year - @last_played_at.year
  end
end
