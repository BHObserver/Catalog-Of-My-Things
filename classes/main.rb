# main.rb
def display_menu
  puts 'Please select an option:'
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. Add a book'
  puts '4. Exit'
end

def main
  puts 'Welcome to the Catalog of my things App!'
  puts
  loop do
    display_menu
    options = gets.chomp.to_i
    case options
    when 1
      list_all_books
    when 2
      list_all_labels
    when 3
      add_book
    when 4
      puts 'Exiting the program. Goodbye!'
      break
    else
      invalid_option
    end
  end
end

main
