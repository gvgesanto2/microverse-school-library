require_relative './create_classroom_service.rb'

class CreateClassroomPresenter
  def initialize(classrooms_repository)
    @classrooms_repository = classrooms_repository
  end

  def handle(request)
    create_classroom_service = CreateClassroomService.new(@classrooms_repository)
    new_classroom = create_classroom_service.execute(request)

    new_classroom
  end
end
