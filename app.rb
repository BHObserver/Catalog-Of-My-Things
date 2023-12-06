require_relative 'classes/book'
require_relative 'classes/label'
require 'json'

class App
  attr_accessor :labels, :books

  def initialize
    @labels = []
    @books = []
  end

  def add_label(title, color)
    label = Label.new(title, color)
    @labels << label
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels added'
      puts ' '
    else
      puts 'List of all labels:'
      @labels.each_with_index do |label, index|
        puts "#{index + 1}. Label: #{label.title}, Color: #{label.color}"
        puts ' '
      end
    end
  end

  def list_all_books
    if @books.empty?
      puts 'No books added'
      puts ' '
    else
      @books.each_with_index do |book, index|
        print "#{index + 1}-[Book], "
        print "ID: #{book.id}, "
        print "Publisher: #{book.publisher}, "
        print "Publish Date: #{book.publish_date}, "
        print "Cover State: #{book.cover_state}, "
        puts "Archived: #{book.can_be_archived?}"
        puts ' '
      end
    end
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publish_date, publisher, cover_state)
    @books << book
    puts ' '
    puts 'The book is added successfully ✅'
    puts '--__--__--__--__--__--__--__--__--'
    puts ' '
  end

  def save_data
    save_books
    save_labels
  end

  def load_data
    load_books
    load_labels
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
