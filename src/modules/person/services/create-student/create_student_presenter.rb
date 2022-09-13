require_relative './create_student_service.rb'

class CreateStudentPresenter
  def initialize(people_repository, classrooms_repository)
    @people_repository = people_repository
    @classrooms_repository = classrooms_repository
  end

  def handle(request)
    name, age, parent_permission, classroom_label  = request.values_at(:name, :age, :parent_permission, :classroom_label)
    create_student_service = CreateStudentService.new(@people_repository, @classrooms_repository)
    create_student_service.execute(
      name: name,
      age: age,
      parent_permission: parent_permission,
      classroom_label: classroom_label
    )
  end
end
