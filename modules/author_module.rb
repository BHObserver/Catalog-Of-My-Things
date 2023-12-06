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
end
