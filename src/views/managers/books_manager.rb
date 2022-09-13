require_relative '../../utils/console.utils'
require_relative '../components/book_component'
require_relative '../components/ordered_list_component'

class BooksManager
  def initialize(create_book:, list_books:)
    @create_book = create_book
    @list_books = list_books
  end

  def handle_create_book
    title = get_user_input('Enter the book title: ')
    author = get_user_input('Enter the book author: ')
    new_book = @create_book.call(title: title, author: author)
    print_message('Book registered successfuly')
    puts 'The new book registered:'
    book_component = BookComponent.new(new_book)
    book_component.render
  end

  def handle_list_books
    books = @list_books.call

    if books.empty?
      puts 'No books available.'
    else
      books_str = books.map { |book| BookComponent.new(book).to_string }
      ordered_list = OrderedListComponent.new(books_str)
      ordered_list.render
    end
  end
end
