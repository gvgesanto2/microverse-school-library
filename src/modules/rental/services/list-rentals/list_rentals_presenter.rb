require_relative './list_rentals_service'

class ListRentalsPresenter
  def initialize(rentals_repository)
    @rentals_repository = rentals_repository
  end

  def handle
    list_rentals_service = ListRentalsService.new(@rentals_repository)
    rentals = list_rentals_service.execute

    return {
      success: true,
      data: rentals
    }
  end
end
