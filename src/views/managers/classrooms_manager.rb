require_relative '../../utils/console.utils'
require_relative '../components/classroom_component'
require_relative '../components/ordered_list_component'

class ClassroomsManager
  def initialize(create_classroom:, list_classrooms:)
    @create_classroom = create_classroom
    @list_classrooms = list_classrooms
  end

  def handle_create_classroom
    label = get_user_input('Enter the classroom label: ')
    new_classroom = @create_classroom.call(label)
    print_message('Classroom registered successfuly')
    puts 'The new classroom registered:'
    classroom_component = ClassroomComponent.new(new_classroom)
    classroom_component.render
  end

  def handle_list_classrooms
    classrooms = @list_classrooms.call

    if classrooms.empty?
      puts 'No classrooms available.'
    else
      classrooms_str = classrooms.map { |classroom| ClassroomComponent.new(classroom).to_string }
      ordered_list = OrderedListComponent.new(classrooms_str)
      ordered_list.render
    end
  end
end
