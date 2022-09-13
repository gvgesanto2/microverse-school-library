require_relative './views/managers/screen_manager'
require_relative './modules/book/services/create-book/create_book_presenter'
require_relative './modules/book/services/list-books/list_books_presenter'
require_relative './modules/classroom/services/create-classroom/create_classroom_presenter'
require_relative './modules/classroom/services/list-classrooms/list_classrooms_presenter'
require_relative './modules/person/services/create-student/create_student_presenter'
require_relative './modules/person/services/create-teacher/create_teacher_presenter'
require_relative './modules/person/services/list-people/list_people_presenter'
require_relative './modules/rental/services/list-rentals/list_rentals_presenter'
require_relative './modules/rental/services/list-rentals-by-person/list_rentals_by_person_presenter'
require_relative './modules/rental/services/create-rental/create_rental_presenter'

class App
  def initialize(
    books_repository,
    classrooms_repository,
    people_repository,
    rentals_repository
  )
    @loop = true
    create_book_presenter = CreateBookPresenter.new(books_repository)
    list_books_presenter = ListBooksPresenter.new(books_repository)
    create_classroom_presenter = CreateClassroomPresenter.new(classrooms_repository)
    list_classrooms_presenter = ListClassroomsPresenter.new(classrooms_repository)
    list_people_presenter = ListPeoplePresenter.new(people_repository)
    create_student_presenter = CreateStudentPresenter.new(people_repository, classrooms_repository)
    create_teacher_presenter = CreateTeacherPresenter.new(people_repository)
    list_rentals_presenter = ListRentalsPresenter.new(rentals_repository)
    list_rentals_by_person_presenter = ListRentalsByPersonPresenter.new(rentals_repository)
    create_rental_presenter = CreateRentalPresenter.new(rentals_repository, people_repository, books_repository)

    @handlers = {
      book: {
        create: lambda { |req| create_book_presenter.handle(req) },
        list: lambda { list_books_presenter.handle }
      },
      classroom: {
        create: lambda { |req| create_classroom_presenter.handle(req) },
        list: lambda { list_classrooms_presenter.handle }
      },
      person: {
        list: lambda { list_people_presenter.handle }
      },
      student: {
        create: lambda { |req| create_student_presenter.handle(req) },
      },
      teacher: {
        create: lambda { |req| create_teacher_presenter.handle(req) },
      },
      rental: {
        list: lambda { list_rentals_presenter.handle },
        list_by_person: lambda { |req| list_rentals_by_person_presenter.handle(req) },
        create: lambda { |req| create_rental_presenter.handle(req) }
      },
      app: {
        exit: lambda { @loop = false }
      }
    }
  end

  def run
    screen_manager = ScreenManager.new(@handlers)

    while @loop
      screen_manager.build
    end
  end
end
