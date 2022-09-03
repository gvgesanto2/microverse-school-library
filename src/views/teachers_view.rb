require_relative '../utils/console.utils'

class TeachersView
  def get_name
    get_user_input('Enter the teacher\'s name: ')
  end

  def get_age
    get_user_input('Enter the teacher\'s age: ')
  end

  def get_specialization
    get_user_input('Enter the teacher\'s specialization: ')
  end

  def print_teachers(teachers)
    if teachers.empty?
      puts "No teachers available."
    else
      lines_to_print = teachers.map.with_index do |teacher, index|
        "#{index + 1}- ID: #{teacher.id} | Name: #{teacher.name} | Age: #{teacher.age} | Specialization: #{teacher.specialization}"
      end
      puts gen_frame(lines_to_print, 5)
    end
  end

  def print_success_message
    puts gen_frame(['Teacher registered successfuly'], 5)
  end
end
