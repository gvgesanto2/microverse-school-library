class InMemoryPeopleRepository
  def initialize
    @people = []
  end

  def fetch_all
    @people
  end

  def find_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end

  def save(new_person)
    @people.push(new_person)
  end

  def empty?
    @people.empty?
  end
end
