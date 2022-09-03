require_relative '../utils/console.utils'

class RentalsView
  def get_person_id
    get_user_input('Enter the ID of the person you want to select: ').to_i
  end

  def print_rentals(rentals)
    if rentals.empty?
      puts "No rentals available."
    else
      lines_to_print = rentals.map.with_index do |rental, index|
        "#{index + 1}- #{get_rental_string(rental)}"
      end
      puts gen_frame(lines_to_print, 5)
    end
  end

  def get_rental_string(rental)
    "Book rented: #{rental.book.title} | Person responsible: #{rental.person.name} | Date: #{rental.date}"
  end

  def print_success_message
    puts gen_frame(['Rental registered successfuly'], 5)
  end

  def print_message(msg)
    puts gen_frame([msg], 5)
  end
end
