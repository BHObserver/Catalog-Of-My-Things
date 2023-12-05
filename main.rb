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
end

CatalogApp.new.start
