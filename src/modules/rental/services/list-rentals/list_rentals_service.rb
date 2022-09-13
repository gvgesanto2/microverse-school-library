require_relative '../../models/rental'

class ListRentalsService
  def initialize(rentals_repository)
    @rentals_repository = rentals_repository
  end

  def execute
    @rentals_repository.fetch_all
  end
end
