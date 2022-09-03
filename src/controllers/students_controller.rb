require_relative '../views/students_view'
require_relative '../models/student'

class StudentsController
  def initialize(classrooms_controller)
    @students_view = StudentsView.new
    @classrooms_controller = classrooms_controller
    @students = []
  end

  def add_student(name, age, parent_permission, classroom)
    new_student = Student.new(age: age, parent_permission: parent_permission, name: name, classroom: classroom)
    @students.push(new_student)
  end

  def handle_register_student
    if @classrooms_controller.has_classrooms?
      name = @students_view.get_name
      age = @students_view.get_age
      parent_permission = @students_view.get_parent_permission
      @classrooms_controller.handle_list_classrooms
      classroom_label = @students_view.get_classroom_label
      classroom = @classrooms_controller.find_classroom_by_label(classroom_label)

      if classroom
        add_student(name, age, parent_permission, classroom)
        @students_view.print_success_message
      else
        @students_view.print_message('Classroom label invalid.')
      end
    else
      @students_view.print_message('No classrooms available. Please, register a classroom before registering a student.')
    end
  end

  def handle_list_students
    @students_view.print_students(@students)
  end
end
