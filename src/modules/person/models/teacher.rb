require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age:, specialization:, name: 'Unknown')
    @specialization = specialization
    super(age: age, name: name)
  end

  def can_use_services?
    true
  end
end
