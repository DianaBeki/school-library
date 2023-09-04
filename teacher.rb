require './person'
# methods and variable for the class
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
