require_relative './create_rental_service.rb'

class CreateRentalPresenter
  def initialize(rentals_repository, people_repository, books_repository)
    @rentals_repository = rentals_repository
    @people_repository = people_repository
    @books_repository = books_repository
  end

  def handle(request)
    begin
      person_id, book_id = request.values_at(:person_id, :book_id)

      create_rental_service = CreateRentalService.new(
        @rentals_repository,
        @people_repository,
        @books_repository
      )
      new_rental = create_rental_service.execute(
        person_id: person_id,
        book_id: book_id
      )

      return {
        success: true,
        data: new_rental
      }
    rescue => exception
      return {
        success: false,
        error: exception.message
      }
    end
  end
end
