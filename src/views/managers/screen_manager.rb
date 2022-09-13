require_relative './menu_manager'
require_relative './books_manager'
require_relative './classrooms_manager'
require_relative './people_manager'
require_relative './rentals_manager'

class ScreenManager
  def initialize(handlers)
    @handlers = handlers
    @books_manager = BooksManager.new(
      create_book: @handlers[:book][:create],
      list_books: @handlers[:book][:list]
    )
    @classrooms_manager = ClassroomsManager.new(
      create_classroom: @handlers[:classroom][:create],
      list_classrooms: @handlers[:classroom][:list]
    )
    @people_manager = PeopleManager.new(
      create_student: @handlers[:student][:create],
      create_teacher: @handlers[:teacher][:create],
      list_people: @handlers[:person][:list],
      list_classrooms: @handlers[:classroom][:list]
    )
    @rentals_manager = RentalsManager.new(
      create_rental: @handlers[:rental][:create],
      list_rentals_by_person: @handlers[:rental][:list_by_person],
      list_rentals: @handlers[:rental][:list],
      list_books: @handlers[:book][:list],
      list_people: @handlers[:person][:list]
    )

    @main_options = [
      {
        title: 'List all books.',
        handler: -> { @books_manager.handle_list_books }
      },
      {
        title: 'List all people.',
        handler: -> { @people_manager.handle_list_people }
      },
      {
        title: 'List all classrooms.',
        handler: -> { @classrooms_manager.handle_list_classrooms }
      },
      {
        title: 'Register a book.',
        handler: -> { @books_manager.handle_create_book }
      },
      {
        title: 'Register a person.',
        handler: -> { @people_manager.handle_create_person }
      },
      {
        title: 'Register a classroom.',
        handler: -> { @classrooms_manager.handle_create_classroom }
      },
      {
        title: 'Rent a book.',
        handler: -> { @rentals_manager.handle_create_rental }
      },
      {
        title: 'List all rentals of a person.',
        handler: -> { @rentals_manager.handle_list_rentals_by_person }
      },
      {
        title: 'Exit.',
        handler: lambda { puts 'Exit'; @handlers[:app][:exit].call }
      }
    ]
  end

  def build
    main_options_titles = @main_options.map { |option| option[:title] }
    menu_component = MenuComponent.new(main_options_titles)
    menu_component.render
    user_option = menu_component.get_user_option

    @main_options[user_option - 1][:handler].call if user_option
  end
end
