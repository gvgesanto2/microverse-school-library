require_relative '../views/menu_view'
require_relative '../views/people_view'
require_relative './teachers_controller'

class PeopleController
  def initialize
    @people_view = PeopleView.new
    @teachers_controller = TeachersController.new

    @options = [
      {
        title: 'Register a student',
        handler: lambda { |name, age| handle_register_student(name, age) }
      },
      {
        title: 'Register a teacher',
        handler: lambda { |name, age| @teachers_controller.handle_register_teacher(name, age) }
      }
    ]
  end

  def handle_register_student(name, age)
    puts 'Register student'
  end

  def handle_register_person
    options_titles = @options.map { |option| option[:title] }
    person_menu_view = MenuView.new(options_titles)
    person_menu_view.show_options
    user_option = person_menu_view.get_user_option

    if user_option
      name = @people_view.get_name
      age = @people_view.get_age
      @options[user_option - 1][:handler].call(name, age)
    end
  end
end
