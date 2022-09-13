require_relative '../../models/classroom'

class CreateClassroomService
  def initialize(classrooms_repository)
    @classrooms_repository = classrooms_repository
  end

  def execute(label)
    new_classroom = Classroom.new(label)
    @classrooms_repository.save(new_classroom)
    new_classroom
  end
end
