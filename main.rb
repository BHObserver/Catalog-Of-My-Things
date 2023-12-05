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
end

CatalogApp.new.start
