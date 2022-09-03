require_relative '../utils/console.utils'

class StudentsView
  def get_name
    get_user_input('Enter the student\'s name: ')
  end

  def get_age
    get_user_input('Enter the student\'s age: ')
  end

  def get_parent_permission
    get_user_input('Has parent permission? [Y/N]: ').downcase == 'y'
  end

  def get_classroom_label
    get_user_input('Enter the classroom label you want to select: ')
  end

  def print_students(students)
    if students.empty?
      puts 'No students available.'
    else
      lines_to_print = students.map.with_index do |student, index|
        "#{index + 1}- #{get_student_string(student)}"
      end
      puts gen_frame(lines_to_print, 5)
    end
  end

  def get_student_string(student)
    str_left = "ID: #{student.id} | Name: #{student.name} | Age: #{student.age} | "
    str_right = "Parent Permission: #{student.parent_permission ? 'yes' : 'no'} | Classroom: #{student.classroom.label}"
    str_left + str_right
  end

  def print_success_message
    puts gen_frame(['student registered successfuly'], 5)
  end

  def print_message(msg)
    puts gen_frame([msg], 5)
  end
end
