# AuthorModule Class

module AuthorModule
  def list_authors
    if authors.empty?
      puts "\n\e[31mNo authors available!\e[0m\n"
    else
      puts "\nList of Authors \n\n"
      display_author_table
    end
  end

  def add_author
    puts "\nAdd author details:"
    first_name = get_input('First name')
    last_name = get_input('Last name')

    author = Author.new(first_name: first_name, last_name: last_name)
    authors << author
    puts "\e[32mAuthor added successfully!\e[0m"
  end

  def find_author(id)
    authors.find { |author| author.id == id }
  end

  private

  def authors
    @authors ||= []
  end

  def display_author_table
    puts '---------------------------------------------------------'
    puts "| ID \t\t| Name \t\t\t\t\t|"
    puts '---------------------------------------------------------'

    authors.each do |author|
      puts "| #{author.id} \t\t| #{author.full_name.ljust(30)}|"
      puts '---------------------------------------------------------'
    end
    save_data('authors.json', authors)
  end

  def get_input(prompt)
    print "#{prompt}: "
    input = gets.chomp.to_s
    input.empty? ? 'Unknown' : input
  end

  def save_data(file_path, data)
    full_path = File.join('data', file_path)
    FileUtils.mkdir_p(File.dirname(full_path)) unless File.directory?(File.dirname(full_path))
    File.write(full_path, JSON.pretty_generate(data.map(&:to_hash)))
  end

  def load_data(file_path, entity_class)
    full_path = File.join('data', file_path)
    return [] unless File.exist?(full_path)

    JSON.parse(File.read(full_path)).map do |data|
      entity_class.new(*data.values_at(*entity_class.new(nil, nil).to_hash.keys))
    end
  end
end
