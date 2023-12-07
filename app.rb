require_relative 'classes/games'
require_relative 'classes/author'
require_relative 'data_manager'
require './modules/author_module'
require './modules/game_module'

class App
  include GameModule
  include AuthorModule

  attr_reader :labels, :games, :authors

  def initialize
    @games = DataManager.load_games
    @authors = DataManager.load_authors
  end

  private

  def get_date_input(prompt)
    print "#{prompt}: "
    Date.parse(gets.chomp)
  rescue ArgumentError
    puts "\e[31mInvalid date format! Please enter in dd/mm/yy format.\e[0m"
    retry
  end

  def get_yes_no_input(prompt)
    print "#{prompt}: "
    gets.chomp.downcase == 'y'
  end
end
