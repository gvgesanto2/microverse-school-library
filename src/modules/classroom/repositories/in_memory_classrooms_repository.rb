class InMemoryClassroomsRepository
  def initialize
    @classrooms = []
  end

  def fetch_all
    @classrooms
  end

  def find_by_label(label)
    @classrooms.find { |classroom| classroom.label === label }
  end

  def save(new_classroom)
    @classrooms.push(new_classroom)
  end

  def empty?
    @classrooms.empty?
  end
end
