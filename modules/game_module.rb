# GameModule Class

module GameModule
  def list_games
    if games.empty?
      puts "\n\e[31mNo games available!\e[0m\n"
    else
      puts "\nList of Games\n\n"
      display_game_table
    end
  end

  def add_game
    puts "\nAdd a game:"
    publish_date = get_date_input('Published date (dd/mm/yy)')
    multiplayer = get_yes_no_input('Multiplayer [Y/N]')
    last_played_at = get_date_input('Last played at (dd/mm/yy)')

    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
    author = game_author
    author.add_item(game)
    games << game
    puts "\e[32mGame added successfully!\e[0m"
  end

  def game_author
    if authors.empty?
      add_author
      authors.first
    else
      list_authors
      print "\nEnter author ID: "
      author_index = gets.chomp.to_i
      find_author(author_index)
    end
  end

  private

  def games
    @games ||= []
  end

  def display_game_table
    puts '-------------------------------------------------------------------------'
    puts "| Publish Date \t\t| Mode \t\t\t| Last Played At \t|"
    puts '-------------------------------------------------------------------------'

    games.each do |game|
      puts "| #{game.publish_date} \t\t| " \
           "#{game.multiplayer ? 'Multiplayer' : 'Singleplayer'}\t\t| " \
           "#{game.last_played_at}\t\t|"
      puts '-------------------------------------------------------------------------'
    end
    save_data('games.json', games)
  end

  def get_date_input(prompt)
    print "#{prompt}: "
    Date.parse(gets.chomp)
  rescue ArgumentError
    puts "\e[31mInvalid date format! Please enter in dd/mm/yy format.\e[0m"
    retry
  end

  def get_yes_no_input(prompt)
    print "#{prompt}: "
    gets.chomp.downcase == 'y'
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
      entity_class.new(*data.values_at(*entity_class.new(nil, nil, nil, nil, nil).to_hash.keys))
    end
  end
end
