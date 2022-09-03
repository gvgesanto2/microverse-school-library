require_relative '../views/teachers_view'
require_relative '../models/teacher'

class TeachersController
  def initialize
    @teachers_view = TeachersView.new
    @teachers = []
  end

  def add_teacher(name, age, specialization)
    new_teacher = Teacher.new(age: age, specialization: specialization, name: name)
    @teachers.push(new_teacher)
  end

  def handle_register_teacher
    name = @teachers_view.get_name
    age = @teachers_view.get_age
    specialization = @teachers_view.get_specialization
    add_teacher(name, age, specialization)
    @teachers_view.print_success_message
  end

  def handle_list_teachers
    @teachers_view.print_teachers(@teachers)
  end

  def find_teacher_by_id(id)
    @teachers.find { |teacher| teacher.id == id }
  end

  def has_teachers?
    !@teachers.empty?
  end
end
