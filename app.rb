require_relative 'classes/games'
require_relative 'classes/author'
require_relative 'modules/game_module'
require 'date'

class App
  include GameModule
  include StorageModule

  def initialize
    @games = load_games
    @authors = load_authors
    @game_manager = GameManager.new(@games, @authors)
  end

  def date_valid?(date)
    format = '%d/%m/%Y'
    DateTime.strptime(date, format)
  rescue ArgumentError
    'Invalid date format'
  end

  # ... (other methods not related to games)

  def list_games
    @game_manager.list_games
  end

  def add_game
    @game_manager.add_game
  end

  def save_games
    @game_manager.save_data
  end
end
