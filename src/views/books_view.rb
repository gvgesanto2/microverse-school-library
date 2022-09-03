require_relative '../utils/console.utils'

class BooksView
  def get_book_title
    get_user_input('Enter the book title: ')
  end

  def get_book_author
    get_user_input('Enter the book author: ')
  end

  def print_books(books)
    if books.empty?
      puts "No books available."
    else
      lines_to_print = books.map.with_index do |book, index|
        "#{index + 1}- #{get_book_string(book)}"
      end
      puts gen_frame(lines_to_print, 5)
    end
  end

  def get_book_string(book)
    "Title: #{book.title} | Author: #{book.author}"
  end

  def print_success_message
    puts gen_frame(['Book registered successfuly'], 5)
  end
end
