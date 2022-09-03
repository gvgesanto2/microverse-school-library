require_relative '../utils/console.utils'

class BooksView
  def get_book_title
    get_user_input('Enter the book title: ')
  end

  def get_book_author
    get_user_input('Enter the book author: ')
  end

  def print_success_message
    puts gen_frame(['Book registered successfuly'], 5)
  end
end
