require_relative './list_classrooms_service'

class ListClassroomsPresenter
  def initialize(classrooms_repository)
    @classrooms_repository = classrooms_repository
  end

  def handle
    list_classrooms_service = ListClassroomsService.new(@classrooms_repository)
    classrooms = list_classrooms_service.execute

    classrooms
  end
end
