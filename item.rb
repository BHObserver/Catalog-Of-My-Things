# frozen_string_literal: true

require 'date'

# class item
class Item
  attr_accessor :published_date, :genre, :author, :source, :label

  def initialize(published_date)
    @id = rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = published_date
    @archived = false
  end

  private

  def can_be_archived?
    (Date.today - @published_date).to_i > 365 * 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
