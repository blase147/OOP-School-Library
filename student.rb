require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unkown', parent_permission: true, id: nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @classroom = classroom
    super(age, name, parent_permission: parent_permission, id: id)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
