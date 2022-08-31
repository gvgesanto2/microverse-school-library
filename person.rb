require_relative 'nameable'
require_relative './decorators/capitalize_decorator'
require_relative './decorators/trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  @@num_instances = 0

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @@num_instances += 1
    @id = @@num_instances
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(age: 22, name: '   maximilianus   ')
puts person.correct_name
trimmedPerson = TrimmerDecorator.new(person)
puts trimmedPerson.correct_name 
capitalizedTrimmedPerson = CapitalizeDecorator.new(trimmedPerson)
puts capitalizedTrimmedPerson.correct_name