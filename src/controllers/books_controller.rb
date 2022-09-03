require_relative '../models/book'
require_relative '../views/books_view'
require_relative '../views/menu_view'

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

  def handle_list_books
    @books_view.print_books(@books)
  end

  def list_as_options
    books_options = @books.map { |book| @books_view.get_book_string(book) }
    book_menu_view = MenuView.new(books_options)
    book_menu_view.show_options
    book_chosen = book_menu_view.get_user_option
    book_chosen ? @books[book_chosen - 1] : nil
  end

  def has_books?
    !@books.empty?
  end
end
