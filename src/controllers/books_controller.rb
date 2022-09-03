require_relative '../models/book'
require_relative '../views/books_view'

class BooksController
  def initialize
    @books = []
    @books_view = BooksView.new
  end

  def add_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
  end

  def handle_register_book
    title = @books_view.get_book_title
    author = @books_view.get_book_author
    add_book(title, author)
    @books_view.print_success_message
  end
end
