require 'date'

class Item
  attr_accessor :publish_date, :archived

  def initialize(published_date)
    @id = rand(1...1000)
    @genre = genre
    @author = Author
    @source = source
    @label = Label
    @publish_date = date
    @archived = false
  end

  def can_be_archived?

  end

  def move_to_archive

  end
end