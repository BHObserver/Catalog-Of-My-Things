require 'date'

class GameManager
  attr_accessor :games

  def initialize(games = [])
    @games = games
  end

  def add_game(title, multiplayer: false, last_played_at: nil, **item_params)
    game = Game.new(title, multiplayer, last_played_at, item_params)
    @games << game
    game
  end

  def list_games
    if @games.empty?
      puts 'There are no games in your collection'
    else
      @games.each_with_index do |game, index|
        puts "#{index}. Title: #{game.title} Multiplayer: #{game.multiplayer} Last Played: #{game.last_played_at}"
      end
    end
    puts
  end

  def can_be_archived?(game)
    game.can_be_archived? && (Date.today - game.last_played_at).to_i > 365 * 2
  end
end

# Renamed the class to GameManager
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(title, multiplayer: false, last_played_at: nil, **item_params)
    super(**item_params)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
