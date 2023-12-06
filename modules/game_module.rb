module GameModule
  def list_games
    if @games.empty?
      puts "\n\e[31mNo games available!\e[0m\n"
    else
      puts "\nList of Games\n\n"
      puts '-------------------------------------------------------------------------'
      puts "| Publish Date \t\t| Mode \t\t\t| Last Played At \t|"
      puts '-------------------------------------------------------------------------'
      @games.each do |game|
        puts "| #{game.publish_date} \t\t| #{game.multiplayer ? 'Multiplayer' : 'Singleplayer'}" \
             "\t\t| #{game.last_played_at} \t\t|"
        puts '-------------------------------------------------------------------------'
      end
    end
  end

  def add_game
    puts "\nAdd a game:"
    puts 'Published date (dd/mm/yy): '
    publish_date = parse_date_input
    print 'Multiplayer [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Last played at (dd/mm/yy): '
    last_played_at = parse_date_input
    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
    author = game_author
    author.add_item(game)
    @games << game
    puts "\e[32mGame added successfully!\e[0m"
  end

  def parse_date_input
    Date.parse(gets.chomp)
  rescue ArgumentError
    puts "\e[31mInvalid date format. Please enter a valid date.\e[0m"
    retry
  end

  def game_author
    if @authors.empty?
      add_author
      author_index = @authors[0].id
    else
      list_authors
      print "\nEnter author ID: "
      author_index = gets.chomp.to_i
    end
    find_author(author_index)
  end
end
