# frozen_string_literal: true

def handle_input(choice)
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
