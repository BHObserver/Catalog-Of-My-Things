require_relative 'app'
require_relative 'book_refactor'

def main
  puts 'Welcome to the Catalog of my things App!'
 puts ' '
  app = App.new
  book_refactor = Refactor.new(app)

  app.load_data

  loop do
    puts 'Please select an option by entering a number:'
    puts '  1. 📖  List all books'
    puts '  2. 🏷️   List all labels'
    puts '  3. 📖  Add a book'
    puts '  4. 🚪  Exit'

    options = gets.chomp.to_i

    case options
    when 1
      app.list_all_books
    when 2
      app.list_all_labels
    when 3
      book_refactor.add_book
    when 4
      puts "GoodBye!"
      app.save_data
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

main
