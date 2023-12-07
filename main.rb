require_relative 'app'
require_relative 'book_refactor'

def main
  puts 'Welcome to the Catalog of my things App!'
  puts ' '
  app = App.new
  book_refactor = Refactor.new(app)

  app.load_data

  loop do
    display_options
    input_number = gets.chomp.to_i
    break if input_number == 10
    actions(input_number, app)
    handle_menu_choice(input_number, app, book_refactor)
  end
end

def handle_menu_choice(input_number, app, book_refactor)
  case input_number
  when 1
    book_refactor.add_book
  when 2
    app.list_all_books
  when 3
    app.list_all_labels
  else
    puts 'Invalid option. Please try again.'
  end
end

def actions(input_number, app)
  case input_number
  when 4
    app.add_game
  when 5
    app.list_games
  when 6
    app.list_authors
  when 7
    app.add_music_album
  when 8
    app.list_all_albums
  when 9
    app.list_all_genres
  when 10
    puts 'Thank you for using this app! ♥️ '
    app.save_data
    exit
  else
    puts 'Invalid option, try again'
  end
end

def display_options
  puts 'Please enter or input any option [1-10]'
  puts '1. - Add book'
  puts '2. - List all books'
  puts '3. - List all labels'
  puts '4. - Add a game'
  puts '5. - List all games'
  puts '6. - List all authors'
  puts '7. - Add a music album'
  puts '8. - List all music albums'
  puts '9. - List all genres'
  puts '10. - Exit'
end

main
