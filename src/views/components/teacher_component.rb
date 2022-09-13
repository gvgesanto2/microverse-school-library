require_relative './component'

class TeacherComponent < Component
  def to_string
    "ID: #{@data.id} | Name: #{@data.name} | Age: #{@data.age} | Specialization: #{@data.specialization}"
  end
end
