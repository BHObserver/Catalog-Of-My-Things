require_relative 'genre'
require_relative 'author'
require_relative 'label'
require 'date'
require 'securerandom'

# class item
class Item
  attr_accessor :published_date, :genre, :author, :label, :collection

  def initialize(published_date)
    @id = generate_id
    @genre = genre
    @author = author
    @label = label
    @published_date = published_date
    @archived = false
    @item_collection = []
  end

  def add_label(label)
    @item_collection << label
    label.add_item(self)
  end

  def add_genre(genre)
    @item_collection << genre
    genre.add_item(self)
  end

  # back up of Ometman code
  # def add_author(author)
  #   @item_collection << author
  #   author.add_item(self)
  # end

  # Burhan code
  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def generate_id
    SecureRandom.rand(1..1000)
  end

  def can_be_archived?
    (Date.today - @published_date).to_i > 365 * 10
  end
end
