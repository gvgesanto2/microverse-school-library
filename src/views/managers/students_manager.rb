require_relative '../components/student_component'
require_relative '../components/classroom_component'
require_relative '../components/ordered_list_component'

class StudentsManager
  def initialize(create_student:, list_classrooms:)
    @create_student = create_student
    @list_classrooms = list_classrooms
  end

  def handle_create_student
    classrooms = @list_classrooms.call

    if classrooms.empty?
      print_message('No classrooms available. Please, register a classroom before registering a student.')
    else
      name = get_user_input('Enter the student\'s name: ')
      age = get_user_input('Enter the student\'s age: ').to_i
      parent_permission = get_user_input('Has parent permission? [Y/N]: ').downcase == 'y'

      ordered_list = OrderedListComponent.new(
        classrooms.map { |classroom| ClassroomComponent.new(classroom).to_string }
      )
      ordered_list.render

      label = get_user_input('Enter the classroom label you want to select: ')

      new_student = @create_student.call(
        name: name,
        age: age,
        parent_permission: parent_permission,
        classroom_label: label
      )
      print_message('Student registered successfuly')
      puts 'The new student registered:'
      student_component = StudentComponent.new(new_student)
      student_component.render
    end
  end
end
