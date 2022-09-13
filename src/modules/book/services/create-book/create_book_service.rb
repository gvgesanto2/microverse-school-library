require_relative '../../models/book'

class CreateBookService
  def initialize(books_repository)
    @books_repository = books_repository
  end

  def execute(title:, author:)
    new_book = Book.new(title, author)
    @books_repository.save(new_book)
    new_book
  end
end
