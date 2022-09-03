require_relative '../utils/console.utils'

class PeopleView
  def get_name
    get_user_input('Enter the person\'s name: ')
  end

  def get_age
    get_user_input('Enter the person\'s age: ')
  end
end
