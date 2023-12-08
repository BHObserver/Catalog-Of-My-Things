# item class

require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :author, :label, :genre

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    publish_date_object = Date.parse(@publish_date)
    Date.current.year - publish_date_object.year > 10
  end
end
