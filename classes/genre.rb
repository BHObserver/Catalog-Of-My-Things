# # frozen_string_literal: true

# require_relative 'item'

# class Genre < Item
#   attr_accessor :name, :albums
#   attr_reader :id

#   def initialize(name, published_date)
#     super(published_date)
#     @id = generate_id
#     @name = name
#     @items = []
#   end

#   def add_item(item)
#     return if @album.include?(item)

#     @items << item
#     item.genre(self)
#   end

#   private

#   def generate_id
#     SecureRandom.rand(1..1000)
#   end
# end
