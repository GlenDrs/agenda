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

def reserv_day_hour(date_and_hour,teacher)
  calendar = Calendar.new
  calendar.fill_slots
  Student.new("Aurore").appointmend(date_and_hour,teacher)
end

reserv_day_hour("2022/2/26, 16:00","Julie")
