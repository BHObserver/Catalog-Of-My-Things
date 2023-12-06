# frozen_string_literal: true

require 'json'
require_relative 'classes/author'
require_relative 'classes/book'
require_relative 'classes/games'
require_relative 'classes/genre'
require_relative 'classes/item'
require_relative 'classes/label'
require_relative 'classes/musicalbum'
require_relative 'menu'
require_relative 'actions'

# code to load data here
# def load_data
# end

# code to save data here
# def save_data
# end

# Main
def main
  loop do
    display_menu
    input = gets.chomp.downcase
    break if handle_input(input)
  end
end

at_exit { save_data }

main if __FILE__ == $PROGRAM_NAME
