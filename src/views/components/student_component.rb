require_relative './component'

class StudentComponent < Component
  def to_string
    str_left = "ID: #{@data.id} | Name: #{@data.name} | Age: #{@data.age} | "
    str_right = "Parent Permission: #{@data.parent_permission ? 'yes' : 'no'} | Classroom: #{@data.classroom.label}"
    str_left + str_right
  end
end
