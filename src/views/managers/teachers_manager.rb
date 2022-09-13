require_relative '../../utils/console.utils'
require_relative '../components/teacher_component'
require_relative '../components/ordered_list_component'

class TeachersManager
  def initialize(create_teacher:)
    @create_teacher = create_teacher
  end

  def handle_create_teacher
    name = get_user_input('Enter the teacher\'s name: ')
    age = get_user_input('Enter the teacher\'s age: ').to_i
    specialization = get_user_input('Enter the teacher\'s specialization: ')
    new_teacher = @create_teacher.call(name: name, age: age, specialization: specialization)
    print_message('Teacher registered successfuly')
    puts 'The new teacher registered:'
    teacher_component = TeacherComponent.new(new_teacher)
    teacher_component.render
  end
end
