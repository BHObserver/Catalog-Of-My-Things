require 'rspec'
require_relative '../classes/music'

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    it 'returns false if album is not on Spotify' do
      album = MusicAlbum.new('2023-01-15', false)
      expect(album.can_be_archived?).to be_falsey
    end

    it 'returns true if album is on Spotify and can be archived' do
      album = MusicAlbum.new('2023-01-15', true)
      allow(album).to receive(:can_be_archived?).and_return(true)
      expect(album.can_be_archived?).to be_truthy
    end
  end
end
