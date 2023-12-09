require 'rspec'
require_relative './classes/genre'
require_relative './classes/item'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a Genre object with provided name and published date' do
      name = 'Test Genre'
      published_date = '2023-01-15'

      genre = Genre.new(name, published_date)

      expect(genre.name).to eq(name)
      expect(genre.published_date).to eq(published_date)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Test Genre', '2023-01-15')
      item = double('item')
    
      genre.add_item(item)
    
      expect(genre.items).to include(item)
      expect { item.genre }.to raise_error(NoMethodError)
    end
  
    it 'does not add the same item multiple times' do
      genre = Genre.new('Test Genre', '2023-01-15')
      item = double('item')

      genre.add_item(item)
      genre.add_item(item)

      expect(genre.items.size).to eq(1)
    end
  end
end
