module AuthorModule
  def list_authors
    if @authors.empty?
      puts "\n\e[31mNo authors available!\e[0m\n"
      puts
    else
      puts "\nList of Authors \n\n"
      puts '---------------------------------------------------------'
      puts "| ID \t\t| Name \t\t\t\t\t|"
      puts '---------------------------------------------------------'
      @authors.each_with_index do |author, _index|
        puts "| #{author.id} \t\t| #{author.first_name} #{author.last_name} \t\t\t\t|"
        puts '---------------------------------------------------------'
      end
    end
  end

  def add_author
    puts "\nAdd author details:"
    print 'First name: '
    first_name = gets.chomp.to_s
    first_name = 'Unknown' if first_name.empty?
    print 'Last name: '
    last_name = gets.chomp.to_s
    last_name = 'Unknown' if last_name.empty?
    author = Author.new(first_name: first_name, last_name: last_name)
    @authors << author
    puts "\e[32mAuthor added successfully!\e[0m"
  end
end
