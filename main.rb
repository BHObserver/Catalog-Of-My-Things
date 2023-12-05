require_relative 'app'

class CatalogApp
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to the Catalog of Things!'
    main_menu
  end

  private

  def main_menu
    loop do
      display_main_options
      choice = gets.chomp.to_i

      case choice
      when 1..6
        perform_listing_action(choice)
      when 7..12
        perform_addition_action(choice)
      when 13
        exit_app
        break
      else
        puts 'Invalid option, please try again.'
      end
    end
  end

  def perform_listing_action(choice)
    listing_actions = %i[list_books list_album list_games list_genre list_labels list_authors]
    @app.send(listing_actions[choice - 1])
  end

  def perform_addition_action(choice)
    addition_actions = %i[list_movies list_source add_new_book add_new_album add_game add_new_movie]
    @app.send(addition_actions[choice - 7])
    @app.save_data if choice == 11
  end

  def exit_app
    puts "\e[31mThank you for using this app! ♥️ \e[0m"
  end

  def display_main_options
    puts 'Please enter an option [1-13]:'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. List all movies'
    puts '8. List all sources'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a game'
    puts '12. Add a movie'
    puts '13. Exit'
    print 'Your choice: '
  end
end

CatalogApp.new.start
