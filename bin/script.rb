require_relative '../lib/teacher'

def creating_teachers
  julie_teacher = Teacher.new("Julie")
  mehdi_teacher = Teacher.new("Mehdi")
  julie_teacher.display_name
  mehdi_teacher.display_name
end

def creating_student
  aurore_student = Student.new("Aurore")
  moderna_student = Student.new("Aurore")
end

creating_teachers
