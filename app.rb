require_relative 'classes/games'
require_relative 'classes/author'
require_relative 'data_manager'
require './modules/author_module'
require './modules/game_module'
require_relative 'classes/book'
require_relative 'classes/label'
require 'json'

class App
  attr_accessor :labels, :books

  def initialize
    @games = DataManager.load_games
    @authors = DataManager.load_authors
  end

  private

  def load_books
    if File.exist?('data/book.json')
      data = JSON.parse(File.read('data/book.json'))
      @books = data.map { |book| Book.new(book['publish_date'], book['publisher'], book['cover_state']) }
    else
      []
    end
  end

  def save_books
    File.open('data/book.json', 'w') do |file|
      data = @books.map do |book|
        {
          'id' => book.id,
          'publish_date' => book.publish_date,
          'publisher' => book.publisher,
          'cover_state' => book.cover_state
        }
      end
      file.write(JSON.generate(data))
    end
  end

  def load_labels
    if File.exist?('data/label.json')
      data = JSON.parse(File.read('data/label.json'))
      @labels = data.map { |label| Label.new(label['title'], label['color']) }
    else
      []
    end
  end

  def save_labels
    File.open('data/label.json', 'w') do |file|
      data = @labels.map do |label|
        {
          'title' => label.title,
          'color' => label.color
        }
      end
      file.write(JSON.generate(data))
    end
  end
end
