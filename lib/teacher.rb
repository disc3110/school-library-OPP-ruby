class Teacher < Person
  def initialize(age, name = 'Unknow', parent_permission = true, specialization = "Unknown")
    @specialization = specialization
    super(age, name, parent_permission)
  end

  def can_use_services?
    true
  end
end
