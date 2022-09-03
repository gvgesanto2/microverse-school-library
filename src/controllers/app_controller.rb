require_relative '../views/menu_view'
require_relative './books_controller'
require_relative './people_controller'
require_relative './classrooms_controller'

class AppController
  def initialize
    @loop = true
    @books_controller = BooksController.new
    @classrooms_controller = ClassroomsController.new
    @people_controller = PeopleController.new(@classrooms_controller)

    @options = [
      {
        title: 'List all books',
        handler: lambda { @books_controller.handle_list_books }
      },
      {
        title: 'List all people',
        handler: lambda { @people_controller.handle_list_people }
      },
      {
        title: 'List all classrooms',
        handler: lambda { @classrooms_controller.handle_list_classrooms }
      },
      {
        title: 'Register a book',
        handler: lambda { @books_controller.handle_register_book }
      },
      {
        title: 'Register a person',
        handler: lambda { @people_controller.handle_register_person }
      },
      {
        title: 'Register a classroom',
        handler: lambda { @classrooms_controller.handle_register_classroom }
      },
      {
        title: 'Rent a book',
        handler: lambda { puts 'Selected option 2' }
      },
      {
        title: 'List all rentals of a person',
        handler: lambda { puts 'Selected option 2' }
      },
      {
        title: 'List all students of a classroom',
        handler: lambda { puts 'Selected option 2' }
      },
      {
        title: 'Exit',
        handler: lambda { puts 'Exit'; @loop = false }
      }
    ]
  end

  def run
    options_titles = @options.map { |option| option[:title] }
    main_menu_view = MenuView.new(options_titles)

    while @loop do
      main_menu_view.show_options
      user_option = main_menu_view.get_user_option

      handle_user_option(user_option) if user_option
    end
  end

  def handle_user_option(option)
    @options[option - 1][:handler].call
  end
end
