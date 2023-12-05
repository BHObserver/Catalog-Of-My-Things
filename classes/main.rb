# main.rb
  def main
    puts 'Welcome to the Catalog of my things App!'
  loop do
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. Exit'
    options = gets.chomp.to_i
    case options
    when 1
      puts 'List of all books'
    when 2
      puts 'List of all labels'
    when 3
      puts 'Add a book'
    when 4
      puts 'Exiting the program. Goodbye!'
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

main
