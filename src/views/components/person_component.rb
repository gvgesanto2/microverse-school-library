require_relative './component'
require_relative './student_component'
require_relative './teacher_component'

class PersonComponent < Component
  def to_string
    if @data.is_a?(Student)
      "[STUDENT] - #{StudentComponent.new(@data).to_string}"
    else
      "[TEACHER] - #{TeacherComponent.new(@data).to_string}"
    end
  end
end
