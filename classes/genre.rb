require_relative 'item'

# genre class
class Genre < Item
  attr_accessor :name, :albums
  attr_reader :id

  def initialize(name, published_date)
    super(published_date)
    @id = generate_id
    @name = name
    @albums = []
  end

  def add_item(item)
    return if @album.include?(item)

    @albums << item
    item.add_genre(self)
  end

  private

  def generate_id
    SecureRandom.rand(1..1000)
  end
end
