# spec/game_spec.rb

require_relative '../classes/games' # Adjust the path based on your project structure
require_relative '../classes/author' # Adjust the path based on your project structure
require 'rspec'

RSpec.describe Game do
  let(:author) { Author.new(first_name: 'John', last_name: 'Doe') }

  subject(:game) do
    Game.new(
      multiplayer: true,
      last_played_at: Time.new(2021, 1, 1),
      publish_date: Time.new(2020, 1, 1),
      author: author # Pass the author instance during initialization
    )
  end

  describe '#initialize' do
    it 'sets the attributes correctly' do
      expect(game.multiplayer).to be true
      expect(game.last_played_at).to eq(Time.new(2021, 1, 1))
      expect(game.publish_date).to eq(Time.new(2020, 1, 1))
      expect(game.author).to eq(author)
    end
  end

  describe '#can_be_archived?' do
    context 'when the game can be archived' do
      it 'returns true' do
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when the game cannot be archived' do
      it 'returns false' do
        # Adjust the last_played_at date to be less than 2 years ago
        game.last_played_at = Time.new(2022, 1, 1)
        expect(game.can_be_archived?).to be false
      end
    end
  end

  describe '#years_since_last_played' do
    it 'calculates the correct number of years since last played' do
      years_since_played = game.years_since_last_played
      expect(years_since_played).to eq(1)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the game' do
      expected_json = {
        id: game.id,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        author: game.author
      }.to_json

      expect(game.to_json).to eq(expected_json)
    end
  end
end
