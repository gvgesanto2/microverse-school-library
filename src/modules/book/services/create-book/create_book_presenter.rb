require_relative './create_book_service.rb'

class CreateBookPresenter
  def initialize(books_repository)
    @books_repository = books_repository
  end

  def handle(request)
    title, author = request.values_at(:title, :author)

    create_book_service = CreateBookService.new(@books_repository)
    new_book = create_book_service.execute(title: title, author: author)

    new_book
  end
end
