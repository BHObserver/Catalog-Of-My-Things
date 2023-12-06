require 'date'
require 'securerandom'

class Item
  attr_accessor :published_date

  def initialize(published_date)
    @id = generate_id
    @genre = genre
    @author = author
    @label = label
    @published_date = published_date
    @archived = false
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def genre=(item)
    @genre = item
    genre.items << self unless genre.items.include?(self)
  end

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
