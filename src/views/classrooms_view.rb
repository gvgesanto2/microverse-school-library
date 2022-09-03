require_relative '../utils/console.utils'

class ClassroomsView
  def get_label
    get_user_input('Enter the classroom\'s label: ')
  end

  def print_classrooms(classrooms)
    if classrooms.empty?
      puts 'No classrooms available.'
    else
      lines_to_print = classrooms.map.with_index do |classroom, index|
        "#{index + 1}- #{get_classroom_string(classroom)}"
      end
      puts gen_frame(lines_to_print, 5)
    end
  end

  def get_classroom_string(classroom)
    "Label: #{classroom.label}"
  end

  def print_success_message
    puts gen_frame(['Classroom registered successfuly'], 5)
  end
end
