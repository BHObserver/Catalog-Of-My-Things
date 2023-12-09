# game_spec.rb

require 'rspec'
require_relative '../classes/games'

describe Game do
  let(:current_year) { 2023 }
  let(:last_played_at) { Time.new(current_year - 3, 1, 1) }

  subject(:game) do
    Game.new(
      multiplayer: true,
      last_played_at: last_played_at,
      publish_date: '2010-01-01'
    )
  end

  describe '#can_be_archived?' do
    context 'when the game can be archived' do
      it 'returns true' do
        allow(Time).to receive(:current).and_return(Time.new(current_year, 1, 1))
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when the game cannot be archived' do
      it 'returns false' do
        allow(Time).to receive(:current).and_return(Time.new(current_year, 1, 1))
        game.instance_variable_set(:@last_played_at, Time.new(current_year - 1, 1, 1)) # Played last year
        expect(game.can_be_archived?).to be false
      end
    end
  end

  describe '#years_since_last_played' do
    it 'calculates the correct years since last played' do
      allow(Time).to receive(:current).and_return(Time.new(current_year, 1, 1))
      expect(game.years_since_last_played).to eq(3)
    end
  end

  describe '#to_json' do
    it 'returns a valid JSON representation' do
      json_result = game.to_json
      parsed_json = JSON.parse(json_result)

      expect(parsed_json).to include(
        'id' => game.id,
        'publish_date' => game.publish_date,
        'multiplayer' => game.multiplayer,
        'author' => game.author
      )
    end
  end
end
