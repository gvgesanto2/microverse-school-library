class InMemoryBooksRepository
  def initialize
    @books = []
  end

  def fetch_all
    @books
  end

  def find_by_id(book_id)
    @books.find { |book| book.id == book_id }
  end

  def save(new_book)
    @books.push(new_book)
  end

  def empty?
    @books.empty?
  end
end
