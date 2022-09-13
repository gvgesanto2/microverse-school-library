require_relative '../../models/classroom'

class ListClassroomsService
  def initialize(classrooms_repository)
    @classrooms_repository = classrooms_repository
  end

  def execute
    @classrooms_repository.fetch_all
  end
end
