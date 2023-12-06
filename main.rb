require 'json'
require_relative 'classes/author'
require_relative 'classes/book'
require_relative 'classes/games'
require_relative 'classes/genre'
require_relative 'classes/item'
require_relative 'classes/label'
require_relative 'classes/musicalbum'
require_relative 'menu'

# code to load data here
# def load_data
# end

# code to save data here
# def save_data
# end

# Main
def main

  loop do
    display_menu
    choice = gets.chomp.downcase

    case choice
    when 'a'
      list_books(books)
    when 'b'
      list_music_albums(albums)
    when 'c'
      list_games(games)
    when 'd'
      # Logic to list all genres
    when 'e'
      # Logic to list all labels
    when 'f'
      # Logic to list all authors
    when 'g'
      # Logic to add a book
    when 'h'
      # Logic to add a music album
    when 'i'
      # Logic to add a game
    when 'x'
      puts 'Exiting...'
      break
    else
      puts 'Invalid option. Please enter a letter between a and i or x (to exit).'
    end
  end
end

  at_exit { save_data }

main if __FILE__ == $PROGRAM_NAME
