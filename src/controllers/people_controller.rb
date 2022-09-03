require_relative '../views/menu_view'
require_relative './teachers_controller'
require_relative './students_controller'

class PeopleController
  def initialize(classrooms_controller)
    @teachers_controller = TeachersController.new
    @students_controller = StudentsController.new(classrooms_controller)

    @options = [
      {
        title: 'Register a student',
        handler: -> { @students_controller.handle_register_student }
      },
      {
        title: 'Register a teacher',
        handler: -> { @teachers_controller.handle_register_teacher }
      }
    ]
  end

  def handle_register_person
    options_titles = @options.map { |option| option[:title] }
    person_menu_view = MenuView.new(options_titles)
    person_menu_view.show_options
    user_option = person_menu_view.get_user_option

    @options[user_option - 1][:handler].call if user_option
  end

  def handle_list_people
    @teachers_controller.handle_list_teachers
    @students_controller.handle_list_students
  end

  def people?
    @teachers_controller.teachers? || @students_controller.students?
  end

  def find_person_by_id(id)
    teacher = @teachers_controller.find_teacher_by_id(id)
    return teacher if teacher

    @students_controller.find_student_by_id(id)
  end
end
