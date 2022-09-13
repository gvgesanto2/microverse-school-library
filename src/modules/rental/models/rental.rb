require 'date'

class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(person, book)
    self.person = person
    self.book = book
    @date = DateTime.now
  end

  def belongsTo?(person_id)
    person_id == person.id
  end

  def person=(person)
    @person = person
    @person.add_rental(self)
  end

  def book=(book)
    @book = book
    @book.add_rental(self)
  end
end
