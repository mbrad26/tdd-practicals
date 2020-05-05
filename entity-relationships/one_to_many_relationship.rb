class Cohort
  attr_reader :name, :students

  def initialize(name, students)
    @name = name
    @students = students
  end
end

class Student
  def initialize(name)
    @name = name
  end
end

students = [
  Student.new('Marius'),
  Student.new('Mox'),
  Student.new('Ana')
]

cohort = Cohort.new('Green April 2020', students)
