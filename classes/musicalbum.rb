# frozen_string_literal: true

require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify: false, **item_params)
    super(**item_params)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && (Date.today - @last_played_at).to_i > 365 * 2
  end
end
