# author.rb
class Author
  attr_reader :id, :first_name, :last_name, :items

  ID_RANGE = (1..1000).freeze

  def initialize(first_name:, last_name:)
    @id = generate_id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self unless item.author == self
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:to_hash) # Convert each item to hash
    }
  end

  private

  def generate_id
    Random.rand(ID_RANGE)
  end
end
