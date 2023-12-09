require 'fileutils'
require_relative 'classes/games'
require_relative 'classes/author'
require_relative 'data_manager'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/genre'
require_relative 'classes/music'
require 'json'

class App
  attr_reader :labels, :books, :games, :authors, :genres, :albums

  def initialize
    @games = DataManager.load_games
    @authors = DataManager.load_authors
    @labels = []
    @books = []
    @genres = []
    @albums = []
  end

  def add_label(title, color)
    @labels << Label.new(title, color)
    save_labels
  end

  def list_all_labels
    display_list(@labels, 'labels', 'Label: %s, Color: %s')
  end

  def list_all_books
    display_list(@books, 'books', '[Book], ID: %s, Publisher: %s, Publish Date: %s, Cover State: %s, Archived: %s')
  end

  def add_book(publisher, cover_state, publish_date)
    @books << Book.new(publish_date, publisher, cover_state)
    save_data
    puts "\nThe book is added successfully ✅\n--__--__--__--__--__--__--__--__--\n"
  end

  def save_data
    save_books
    save_labels
  end

  def load_data
    load_books
    load_labels
  end

  def load_books
    @books = load_data_from_file('data/book.json', Book)
  end

  def save_books
    save_data_to_file('data/book.json', @books, %w[id publish_date publisher cover_state])
  end

  def load_labels
    @labels = load_data_from_file('data/label.json', Label)
  end

  def save_labels
    save_data_to_file('data/label.json', @labels, %w[title color])
  end

  def list_games
    display_list(@games, 'games', 'Publish Date: %s, Mode: %s, Last Played At: %s', true)
  end

  def list_all_genres
    display_list(@genres, 'genres', 'Name: %s')
  end

  def list_all_albums
    display_list(@albums, 'music albums', 'Publish Date: %s, On Spotify: %s', true)
  end

  def add_music_album
    date = get_date_input('Published date (dd/mm/yy)')
    spotify = get_yes_no_input('On Spotify? [Y/N]')
    genre = add_genre(date)
    album = MusicAlbum.new(date, on_spotify: spotify)
    genre.add_item(album)
    @albums << album
    DataManager.save_album(@albums)
    puts "\e[32mMusic Album added successfully!\e[0m"
  end

  def add_genre(date)
    name = get_input('Genre name')
    genre = Genre.new(name, date)
    @genres ||= []
    @genres << genre
    DataManager.save_genre(@genres)
    genre
  end

  def add_game
    publish_date = get_date_input('Published date (dd/mm/yy)')
    multiplayer = get_yes_no_input('Multiplayer [Y/N]')
    last_played_at = get_date_input('Last played at (dd/mm/yy)')
    author = add_author
    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
    author.add_item(game)
    @games << game
    DataManager.save_game(@games)
    DataManager.save_author(@authors)
    puts "\e[32mGame added successfully!\e[0m"
  end

  def list_authors
    display_list(@authors, 'authors', 'ID: %s, Name: %s %s')
  end

  def add_author
    first_name = get_input('First name')
    last_name = get_input('Last name')
    author = Author.new(first_name: first_name, last_name: last_name)
    @authors ||= []
    @authors << author
    DataManager.save_author(@authors)
    puts "\e[32mAuthor added successfully!\e[0m"
    author
  end

  private

  def display_list(items, title, format, header: false)
    if items.empty?
      puts "\n\e[31mNo #{title} available!\e[0m\n"
    else
      puts "\nList of #{title.capitalize}\n\n"
      puts line_separator(header ? format.split(',').length : 1)

      items.each do |item|
        values = format.split(',').map do |field|
          item.respond_to?(field.strip.to_sym) ? item.send(field.strip.to_sym) : field.strip
        end
        puts "| #{values.join(' | ')} |"
        puts line_separator(format.split(',').length)
      end
    end
  end

  def line_separator(columns)
    separator = columns.times.map { '-' * 25 }.join('+')
    "+#{separator}+"
  end

  def load_data_from_file(file_path, item_class)
    if File.exist?(file_path)
      data = JSON.parse(File.read(file_path))
      data.map { |item_data| item_class.new(*item_data.values) }
    else
      []
    end
  end

  def save_data_to_file(file_path, items, fields)
    File.open(file_path, 'w') do |file|
      data = items.map do |item|
        fields.each_with_object({}) { |field, hash| hash[field] = item.send(field) }
      end
      file.write(JSON.generate(data))
    end
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
