require_relative '../utils/console.utils'

class MainMenuView
  def show_options
    frame = gen_frame(
      [
        '[1] List all books.',
        '[2] List all people.',
        '[3] Register a person.',
        '[4] Register a book.',
        '[5] Rent a book.',
        '[6] List all rentals of a person.',
        '[7] Exit.'
      ],
      5
    )
    puts frame
  end

  def get_user_option
    get_user_input('Please select a option number, then press [ENTER]: ').to_i
  end
end

