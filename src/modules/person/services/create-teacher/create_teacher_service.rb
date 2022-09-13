require_relative '../../models/teacher'

class CreateTeacherService
  def initialize(people_repository)
    @people_repository = people_repository
  end

  def execute(name:, age:, specialization:)
    new_teacher = Teacher.new(
      age: age,
      name: name,
      specialization: specialization
    )

    @people_repository.save(new_teacher)
    new_teacher
  end
end
