require_relative '../../models/student'

class CreateStudentService
  def initialize(people_repository, classrooms_repository)
    @people_repository = people_repository
    @classrooms_repository = classrooms_repository
  end

  def execute(age:, classroom_label:, name: , parent_permission:)
    classroom = @classrooms_repository.find_by_label(classroom_label)

    return 'No classroom with this label.' unless classroom;

    new_student = Student.new(
      age: age,
      classroom: classroom,
      name: name,
      parent_permission: parent_permission
    )

    @people_repository.save(new_student)
    new_student
  end
end
