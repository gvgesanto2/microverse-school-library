require_relative './component'

class ClassroomComponent < Component
  def to_string
    "Label: #{@data.label}"
  end
end
