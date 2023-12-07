require 'date'

class Item
  attr_accessor :labels, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
  end

# require 'securerandom'

# require 'date'
# require 'securerandom'

# class Item
#   attr_accessor :publish_date
#   attr_reader :id, :archived, :label, :author

#   def initialize(publish_date: nil, archived: false)
#     @id = SecureRandom.uuid
#     @publish_date = publish_date
#     @archived = archived
#   end

#   def label=(label)
#     @labels << label unless @labels.include?(label)
#   end

#   def move_to_archive
#     return unless can_be_archived?

#     @archived = true
#   end

#   def can_be_archived?
#     Date.today.year - @publish_date.year > 10
#     @label = label
#     label.add_item(self)
#  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  # def genre=(item)
  #   @genre = item
  #   genre.items << self unless genre.items.include?(self)
  # end

  # def author=(author)
  #   @author = author
  #   author.add_item(self) unless author.items.include?(self)
  # end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  # def move_to_archive
  #   @archived = true if can_be_archived?
  # end

  private

  def can_be_archived?
    Date.current.year - @publish_date.year > 10
  end
end
