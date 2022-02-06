require_relative '../lib/teacher'
require_relative '../lib/student'
require_relative '../lib/lesson'
require_relative '../lib/calendar'

def creating_teachers
  julie_teacher = Teacher.new("Julie")
  mehdi_teacher = Teacher.new("Mehdi")
  julie_teacher.display_name
  mehdi_teacher.display_name
end

def creating_student
  aurore_student = Student.new("Aurore")
  moderna_student = Student.new("Moderna")
  aurore_student.display_name
  moderna_student.display_name
end

calendar = Calendar.new
calendar.fill_slots
calendar.available_slots

creating_teachers
creating_student
