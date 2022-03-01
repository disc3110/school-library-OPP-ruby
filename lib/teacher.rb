class Teacher < Person
  def initialize(age, _name, _parent_permission, specialization)
    super(age, name: 'Unknown', parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
