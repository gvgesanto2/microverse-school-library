class Book
  attr_accessor :title, :author
  attr_reader :id, :rentals

  @@num_instances = 0

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@num_instances += 1
    @id = @@num_instances
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end
end
