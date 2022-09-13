require_relative './component'

class RentalComponent < Component
  def to_string
    "Book rented: #{@data.book.title} | Rented by: #{@data.person.name} | Date: #{@data.date}"
  end
end
