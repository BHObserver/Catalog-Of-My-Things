require 'fileutils'
require_relative 'classes/games'
require_relative 'classes/author'
require_relative 'data_manager'


class App

  attr_reader :labels, :games, :authors

  def initialize
    @games = DataManager.load_games
    @authors = DataManager.load_authors
  end

  def list_games
    if @games.empty?
      puts "\n\e[31mNo games available!\e[0m\n"
    else
      puts "\nList of Games\n\n"
      puts '-------------------------------------------------------------------------'
      puts "| Publish Date \t\t| Mode \t\t\t| Last Played At \t|"
      puts '-------------------------------------------------------------------------'

      @games.each do |game|
        puts "| #{game.publish_date} \t\t| " \
             "#{game.multiplayer ? 'Multiplayer' : 'Singleplayer'}\t\t| " \
             "#{game.last_played_at}\t\t|"
        puts '-------------------------------------------------------------------------'
      end
    end
  end

  def add_game
    puts "\nAdd a game:"
    publish_date = get_date_input('Published date (dd/mm/yy)')
    multiplayer = get_yes_no_input('Multiplayer [Y/N]')
    last_played_at = get_date_input('Last played at (dd/mm/yy)')

    author = add_author
    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)

    # Associate the game with the author
    author.add_item(game)

    # Append the new game
    @games << game

    DataManager.save_game(@games)
    DataManager.save_author(@authors)

    puts "\e[32mGame added successfully!\e[0m"
  end


  def list_authors
    if @authors.empty?
      puts "\n\e[31mNo authors available!\e[0m\n"
    else
      puts "\nList of Authors \n\n"
      puts '---------------------------------------------------------'
      puts "| ID \t\t| Name \t\t\t\t\t|"
      puts '---------------------------------------------------------'

      @authors.each do |author|
        puts "| #{author.id} \t\t| #{author.first_name} #{author.last_name}"
        puts '---------------------------------------------------------'
      end
    end
  end

  def add_author
    puts "\nAdd author details:"
  first_name = get_input('First name')
  last_name = get_input('Last name')

  author = Author.new(first_name: first_name, last_name: last_name)

  # If @authors is nil or not initialized, initialize it as an empty array
  @authors ||= []

  # Append the new author
  @authors << author

  DataManager.save_author(@authors)

  puts "\e[32mAuthor added successfully!\e[0m"

  # Return the newly created author
  author
  end


  def get_input(prompt)
    print "#{prompt}: "
    gets.chomp
  end

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
