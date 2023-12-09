require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :published_date

  def initialize(published_date, on_spotify = false)
    super(published_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(option = {})
    {
      published_date: @published_date,
      on_spotify: @on_spotify
    }.to_json(option)
  end
end
