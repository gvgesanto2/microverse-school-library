class ListPeopleService
  def initialize(people_repository)
    @people_repository = people_repository
  end

  def execute
    @people_repository.fetch_all
  end
end
