class InMemoryRentalsRepository
  def initialize
    @rentals = []
  end

  def fetch_all
    @rentals
  end

  def save(new_rental)
    @rentals.push(new_rental)
  end

  def empty?
    @rentals.empty?
  end
end
