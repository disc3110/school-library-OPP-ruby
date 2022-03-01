class Student < Person
  def initialize(age, _name, _parent_permission, classroom: nil)
    @classroom = classroom
    super(age, name: 'Unknow', parent_permission: true)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
