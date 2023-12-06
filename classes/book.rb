class Book
  attr_accessor :publisher, :published_date, :cover_state

  def initialize(published_date, publisher, cover_state, archived: true)
    super(published_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
