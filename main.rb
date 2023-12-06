require_relative 'app'
require_relative 'book_refactor'

def display_menu
  puts 'Please select an option by entering a number:'
  puts '  1. 📖  List all books'
  puts '  2. 🏷️   List all labels'
  puts '  3. 📖  Add a book'
  puts '  4. 🚪  Exit'
end

def handle_menu_choice(choice, app, book_refactor)
  case choice
  when 1
    app.list_all_books
  when 2
    app.list_all_labels
  when 3
    book_refactor.add_book
  when 4
    puts 'GoodBye!'
    app.save_data
    exit
  else
    puts 'Invalid option. Please try again.'
  end
end

def main
  puts 'Welcome to the Catalog of my things App!'
  puts ' '
  app = App.new
  book_refactor = Refactor.new(app)

  app.load_data

  loop do
    display_menu
    choice = gets.chomp.to_i
    handle_menu_choice(choice, app, book_refactor)
  end
end


# def main
#   app = App.new
#   prompt(app)
# end

# def prompt(app)
#   puts 'Catalog of things!'
#   loop do
#     display_options
#     input_number = gets.chomp.to_i
#     break if input_number == 10

#     actions(input_number, app)
#   end
# end

# def actions(input_number, app)
#   case input_number
#   when 1
#     app.list_books
#   when 3
#     app.list_games
#   when 5
#     app.list_labels
#   when 6
#     app.list_authors
#   when 7
#     app.add_new_book
#   when 9
#     app.add_game
#   else
#     puts 'Invalid option, try again'
#   end
# end

# def display_options
#   puts 'Please enter or input any option [1-10]'
#   puts '1. - List all books'
#   puts '2. - List all music albums'
#   puts '3. - List all games'
#   puts '4. - List all genres'
#   puts '5. - List all labels'
#   puts '6. - List all authors'
#   puts '7. - Add book'
#   puts '8. - Add a music album'
#   puts '9. - Add a game'
#   puts '10. - Exit'
# end

# main
