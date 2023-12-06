require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'modules/game_module'
require_relative 'modules/storage'
require 'json'
require 'date'

class App
  include GameModule
  include StorageModule

  def initialize
    @games = load_games
    @authors = load_authors
    @game_manager = GameManager.new(@games, @authors)
  end


end
