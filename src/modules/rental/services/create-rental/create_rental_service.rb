require_relative '../../models/rental'

class CreateRentalService
  def initialize(rentals_repository, people_repository, books_repository)
    @rentals_repository = rentals_repository
    @people_repository = people_repository
    @books_repository = books_repository
  end

  def execute(person_id:, book_id:)
    person = @people_repository.find_by_id(person_id)

    raise StandardError.new("No person with the ID #{person_id}") unless person

    book = @books_repository.find_by_id(book_id)

    raise StandardError.new("No book with the ID #{book_id}") unless book

    new_rental = Rental.new(person, book)
    @rentals_repository.save(new_rental)
    new_rental
  end
end
