require_relative './list_rentals_by_person_service'

class ListRentalsByPersonPresenter
  def initialize(rentals_repository)
    @rentals_repository = rentals_repository
  end

  def handle(person_id)
    list_rentals_by_person_service = ListRentalsByPersonService.new(@rentals_repository)
    rentals = list_rentals_by_person_service.execute(person_id)

    return {
      success: true,
      data: rentals
    }
  end
end
