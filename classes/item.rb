# frozen_string_literal: true

require 'date'

# item.rb
class Item
  attr_accessor :genres, :authors, :labels, :source, :published_date, :archived
  attr_reader :id

  def initialize(published_date, archived: false)
    @id = SecureRandom.uuid
    @genres = []
    @authors = []
    @labels = []
    @source = []
    @published_date = published_date
    @archived = archived
  end

  def add_label(label)
    @labels << label
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def can_be_archived?
    Date.today.year - @published_date.year > 10
  end
end
