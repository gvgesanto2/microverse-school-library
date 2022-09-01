require_relative './person'
require_relative './student'
require_relative './classroom'
require_relative './decorators/capitalize_decorator'
require_relative './decorators/trimmer_decorator'

classroom = Classroom.new('math')
person = Student.new(age: 22, name: 'maximilianus', classroom: classroom)
puts person.correct_name
trimmed_person = TrimmerDecorator.new(person)
puts trimmed_person.correct_name
capitalized_trimmed_person = CapitalizeDecorator.new(trimmed_person)
puts capitalized_trimmed_person.correct_name
