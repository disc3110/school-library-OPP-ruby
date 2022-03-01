class Student < Person
  attr_reader :classroom

  def initialize(age, _name, _parent_permission, classroom: nil)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
    super(age, name: 'Unknow', parent_permission: true)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
