require_relative './list_people_service'

class ListPeoplePresenter
  def initialize(people_repository)
    @people_repository = people_repository
  end

  def handle
    list_people_service = ListPeopleService.new(@people_repository)
    list_people_service.execute
  end
end
