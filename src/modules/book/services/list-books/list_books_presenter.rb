require_relative './list_books_service'

class ListBooksPresenter
  def initialize(books_repository)
    @books_repository = books_repository
  end

  def handle
    list_books_service = ListBooksService.new(@books_repository)
    books = list_books_service.execute

    books
  end
end
