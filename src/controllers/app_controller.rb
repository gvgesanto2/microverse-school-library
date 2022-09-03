require_relative '../views/main_menu_view'
require_relative './books_controller'

class AppController
  def initialize
    @main_menu_view = MainMenuView.new
    @books_controller = BooksController.new
  end

  def run
    loop do
      @main_menu_view.show_options
      user_option = @main_menu_view.get_user_option

      break if user_option == 7

      handle_user_option(user_option)
    end
  end

  def handle_user_option(option)
    case option
    when 1
      puts 'Selected option 1'
    when 2
      puts 'Selected option 2'
    when 3
      puts 'Selected option 3'
    when 4
      @books_controller.handle_register_book
    when 5
      puts 'Selected option 5'
    when 6
      puts 'Selected option 6'
    end
  end
end
