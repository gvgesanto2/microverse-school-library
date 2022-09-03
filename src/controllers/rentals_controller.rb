require_relative '../models/rental'
require_relative '../views/rentals_view'

class RentalsController
  def initialize(people_controller, books_controller)
    @rentals = []
    @rentals_view = RentalsView.new
    @people_controller = people_controller
    @books_controller = books_controller
  end

  def add_rental(person, book)
    new_rental = Rental.new(person, book)
    @rentals.push(new_rental)
  end

  def handle_register_rental
    unless @people_controller.has_people?
      @rentals_view.print_message('No people available. Please, register a person before renting a book.')
      return;
    end
    unless @books_controller.has_books?
      @rentals_view.print_message('No books available. Please, register a book before renting a book.')
      return;
    end

    @people_controller.handle_list_people
    person_id = @rentals_view.get_person_id

    person = @people_controller.find_person_by_id(person_id)

    unless person
      @rentals_view.print_message('Person ID invalid.')
      return;
    end

    book = @books_controller.list_as_options

    unless book
      @rentals_view.print_message('Book number invalid.')
      return;
    end

    add_rental(person, book)
    @rentals_view.print_success_message
  end

  def handle_list_rentals_by_person
    @people_controller.handle_list_people
    person_id = @rentals_view.get_person_id
    person_rentals = @rentals.filter { |rental| rental.person.id == person_id }
    @rentals_view.print_rentals(person_rentals)
  end
end
