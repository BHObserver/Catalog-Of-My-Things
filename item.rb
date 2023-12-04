# frozen_string_literal: true

# Represents an item in the catalog.
class Item
  attr_accessor :title, :description, :published_date, :archived

  def initialize(title, description, published_date)
    @title = title
    @description = description
    @published_date = published_date
    @archived = false
  end

  def can_be_archived?
    current_year = Time.now.year
    (current_year - @published_date.year) > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts "Item '#{title}' has been archived."
    else
      puts "Item '#{title}' cannot be archived at this time."
    end
  end
end

# require 'date'

# class Item
#   attr_accessor :publish_date, :archived

#   def initialize(published_date)
#     @id = rand(1...1000)
#     @genre = genre
#     @author = Author
#     @source = source
#     @label = Label
#     @publish_date = date
#     @archived = false
#   end

#   def can_be_archived?

#   end

#   def move_to_archive

#   end
# end
