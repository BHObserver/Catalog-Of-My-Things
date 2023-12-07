# AuthorModule Class

require 'fileutils'
require_relative '../data_manager'

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
    DataManager.save_author(author)
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
      puts "| #{author.id} \t\t| #{author.first_name} #{author.last_name}"
      puts '---------------------------------------------------------'
    end
  end

  def get_input(prompt)
    print "#{prompt}: "
    input = gets.chomp.to_s
    input.empty? ? 'Unknown' : input
  end
end
