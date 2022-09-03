require_relative '../models/classroom'
require_relative '../views/classrooms_view'
require_relative '../views/menu_view'

class ClassroomsController
  def initialize
    @classrooms = []
    @classrooms_view = ClassroomsView.new
  end

  def add_classroom(label)
    new_classroom = Classroom.new(label)
    @classrooms.push(new_classroom)
  end

  def list_as_options
    classrooms_options = @classrooms.map { |classroom| @classrooms_view.get_classroom_string(classroom) }
    classroom_menu_view = MenuView.new(classrooms_options)
    classroom_menu_view.show_options
    classroom_chosen = classroom_menu_view.get_user_option
    classroom_chosen ? @classroom[classroom_chosen - 1] : nil
  end

  def has_classrooms?
    !@classrooms.empty?
  end

  def find_classroom_by_label(label)
    @classrooms.find { |classroom| classroom.label.downcase == label.downcase }
  end

  def handle_register_classroom
    label = @classrooms_view.get_label
    add_classroom(label)
    @classrooms_view.print_success_message
  end

  def handle_list_classrooms
    @classrooms_view.print_classrooms(@classrooms)
  end
end
