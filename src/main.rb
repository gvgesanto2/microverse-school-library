require_relative './app'
require_relative './modules/book/repositories/in_memory_books_repository'
require_relative './modules/classroom/repositories/in_memory_classrooms_repository'
require_relative './modules/person/repositories/in_memory_people_repository'
require_relative './modules/rental/repositories/in_memory_rentals_repository'

def main
  books_repository = InMemoryBooksRepository.new
  classrooms_repository = InMemoryClassroomsRepository.new
  people_repository = InMemoryPeopleRepository.new
  rentals_repository = InMemoryRentalsRepository.new

  app = App.new(
    books_repository,
    classrooms_repository,
    people_repository,
    rentals_repository
  )
  app.run
end

main
