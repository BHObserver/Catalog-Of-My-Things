require_relative 'app'

class CatalogApp
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to the Catalog of Things!'
    main_menu
  end
end

CatalogApp.new.start
