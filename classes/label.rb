# frozen_string_literal: true

require_relative 'item'

class Label < Item
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color, **item_params)
    super(**item_params)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.add_label(self)
  end
end
