# spec/item_spec.rb
require 'date'
require_relative '../classes/item'

RSpec.describe Item do
  let(:publish_date) { '2022-01-01' }
  let(:label) { double('label', items: []) }
  let(:author) { double('author', items: [], add_item: nil) }

  describe '#initialize' do
    it 'creates a new Item with valid attributes' do
      item = Item.new(publish_date)
      expect(item.id).to be_between(1, 1000)
      expect(item.publish_date).to eq(publish_date)
    end
  end

  describe '#label=' do
    let(:item) { Item.new(publish_date) }

    it 'sets the label for the item' do
      item.label = label
      expect(label.items).to include(item)
    end
  end

  describe '#move_to_archive' do
    let(:item) { Item.new(publish_date) }

    context 'when the item can be archived' do
      it 'archives the item' do
        allow(item).to receive(:can_be_archived?).and_return(true)
        item.move_to_archive
        expect(item.archived).to be true
      end
    end

    context 'when the item cannot be archived' do
      it 'does not archive the item' do
        allow(item).to receive(:can_be_archived?).and_return(false)
        item.move_to_archive
        expect(item.archived).to be nil
      end
    end
  end

  describe '#can_be_archived?' do
    let(:item) { Item.new(publish_date) }

    it 'returns true if the item can be archived' do
      allow(Date).to receive(:current).and_return(Date.new(2033, 1, 1))
      expect(item.can_be_archived?).to be true
    end

    it 'returns false if the item cannot be archived' do
      allow(Date).to receive(:current).and_return(Date.new(2030, 1, 1))
      expect(item.can_be_archived?).to be false
    end
  end
end
