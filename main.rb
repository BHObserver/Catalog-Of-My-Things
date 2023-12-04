# frozen_string_literal: true

require_relative 'item'

# Represents the application for managing items in the catalog.
class App
  def initialize
    @items = []
  end

  # Starts the application and enters the main loop.
  def start
    loop do
      display_menu_options
      process_user_choice
    end
  end

  private

  def display_menu_options
    puts '1. Create Item'
    puts '2. View Items'
    puts '3. Archive Item'
    puts '4. Quit'
  end

  def process_user_choice
    choice = gets.chomp.to_i

    case choice
    when 1 then create_item
    when 2 then view_items
    when 3 then archive_item
    when 4 then exit_application
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def create_item
    puts 'Enter title:'
    title = gets.chomp

    puts 'Enter description:'
    description = gets.chomp

    puts 'Enter published year:'
    published_year = gets.chomp.to_i

    item = Item.new(title, description, Time.new(published_year))
    @items << item

    puts "Item '#{title}' created successfully."
  end

  def view_items
    puts 'Items:'
    @items.each do |item|
      puts "#{item.title} - #{item.published_date.year} - #{item.archived ? 'Archived' : 'Not Archived'}"
    end
  end

  def archive_item
    puts 'Enter the title of the item to archive:'
    title = gets.chomp

    item_to_archive = @items.find { |item| item.title == title }

    if item_to_archive
      item_to_archive.move_to_archive
    else
      puts 'Item not found.'
    end
  end

  def exit_application
    puts 'Exiting the application. Goodbye!'
    exit
  end
end

app = App.new
app.start
