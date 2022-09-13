require_relative '../components/ordered_list_component'
require_relative '../components/person_component'
require_relative '../components/book_component'
require_relative '../components/rental_component'

class RentalsManager
  def initialize(
    create_rental:,
    list_rentals_by_person:,
    list_rentals:,
    list_books:,
    list_people:
  )
    @create_rental = create_rental
    @list_rentals_by_person = list_rentals_by_person
    @list_rentals = list_rentals
    @list_books = list_books
    @list_people = list_people
  end

  def handle_create_rental
    people = @list_people.call
    books = @list_books.call

    if people.empty?
      print_message('No people available. Please, register a person in the system first before trying to rent a book.')
      return;
    end
    if books.empty?
      print_message('No books available. Please, register a book in the system first before trying to rent a book.')
      return;
    end

    people_ordered_list = OrderedListComponent.new(
      people.map { |person| PersonComponent.new(person).to_string }
    )
    people_ordered_list.render

    person_id = get_user_input('Enter the person ID you want to select: ').to_i

    books_ordered_list = OrderedListComponent.new(
      books.map { |book| BookComponent.new(book).to_string }
    )
    books_ordered_list.render

    book_id = get_user_input('Enter the book ID you want to select: ').to_i

    response = @create_rental.call(
      person_id: person_id,
      book_id: book_id,
    )

    if response[:success]
      new_rental = response[:data]
      print_message('Rental registered successfuly')
      puts 'The new rental registered:'
      rental_component = RentalComponent.new(new_rental)
      rental_component.render
    else
      print_message("Error: #{response[:error]}")
    end
  end

  def handle_list_rentals_by_person
    people = @list_people.call

    if people.empty?
      print_message('No people available. Please, register a person in the system first before trying to rent a book.')
      return;
    end

    people_ordered_list = OrderedListComponent.new(
      people.map { |person| PersonComponent.new(person).to_string }
    )
    people_ordered_list.render

    person_id = get_user_input('Enter the person ID you want to select: ').to_i

    response = @list_rentals_by_person.call(person_id)

    if response[:success]
      rentals = response[:data]
      if rentals.empty?
        puts "No rentals available for the person with ID #{person_id}."
      else
        rentals_str = rentals.map { |rental| RentalComponent.new(rental).to_string }
        ordered_list = OrderedListComponent.new(rentals_str)
        ordered_list.render
      end
    else
      print_message("Error: #{response[:error]}")
    end
  end

  def handle_list_rentals
    response = @list_rentals.call

    if response[:success]
      rentals = response[:data]
      if rentals.empty?
        puts 'No rentals available.'
      else
        rentals_str = rentals.map { |rental| RentalComponent.new(rental).to_string }
        ordered_list = OrderedListComponent.new(rentals_str)
        ordered_list.render
      end
    else
      print_message("Error: #{response[:error]}")
    end
  end
end
