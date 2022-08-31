class Person
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

  private

  def of_age?
    @age >= 18
  end
end
