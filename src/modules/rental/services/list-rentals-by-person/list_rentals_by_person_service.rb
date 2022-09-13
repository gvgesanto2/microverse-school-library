class ListRentalsByPersonService
  def initialize(rentals_repository)
    @rentals_repository = rentals_repository
  end

  def execute(person_id)
    rentals =  @rentals_repository.fetch_all

    rentals.filter { |rental| rental.belongsTo?(person_id) }
  end
end
