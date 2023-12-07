# item class

require 'securerandom'
require 'date'

class Item
  attr_accessor :labels, :publish_date, :archived
  attr_reader :id, :author

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

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.current.year - @publish_date.year > 10
  end
end
