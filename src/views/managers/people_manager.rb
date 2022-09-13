require_relative '../../utils/console.utils'
require_relative './students_manager'
require_relative './teachers_manager'
require_relative '../components/person_component'
require_relative '../components/ordered_list_component'

class PeopleManager
  def initialize(create_student:, create_teacher:, list_people:, list_classrooms:)
    @list_people = list_people
    @students_manager = StudentsManager.new(create_student: create_student, list_classrooms: list_classrooms)
    @teachers_manager = TeachersManager.new(create_teacher: create_teacher)
  end

  def handle_create_person
    options = [
      {
        title: 'Register a student',
        handler: -> { @students_manager.handle_create_student }
      },
      {
        title: 'Register a teacher',
        handler: -> { @teachers_manager.handle_create_teacher }
      }
    ]
    options_titles = options.map { |option| option[:title] }
    menu_component = MenuComponent.new(options_titles)
    menu_component.render
    user_option = menu_component.get_user_option

    options[user_option - 1][:handler].call if user_option
  end


  def handle_list_people
    people = @list_people.call

    if people.empty?
      puts 'No people available.'
    else
      people_str = people.map { |person| PersonComponent.new(person).to_string }
      ordered_list = OrderedListComponent.new(people_str)
      ordered_list.render
    end
  end
end
