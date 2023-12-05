class MusicAlbum
    attr_accessor :title, :color, :items
    attr_reader :id
  
    def initialize(title, color)
      @id = generate_id
      @title = title
      @color = color
      @items = []
    end
  
    def add_item(item)
      return if @items.include?(item)
  
      @items << item
      item.add_label(self)
    end
  
    private
  
    def generate_id
      SecureRandom.rand(1..1000)
    end
end