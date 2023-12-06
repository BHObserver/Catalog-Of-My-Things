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

end
