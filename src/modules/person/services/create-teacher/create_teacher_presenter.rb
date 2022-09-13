require_relative './create_teacher_service.rb'

class CreateTeacherPresenter
  def initialize(people_repository)
    @people_repository = people_repository
  end

  def handle(request)
    name, age, specialization = request.values_at(:name, :age, :specialization)

    create_teacher_service = CreateTeacherService.new(@people_repository)
    create_teacher_service.execute(
      name: name,
      age: age,
      specialization: specialization
    )
  end
end
