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
  list_students = []
  list_students << Student.new("Aurore")
  list_students << Student.new("Moderna")
  list_students
end

def agenda_copleted
  calendar = Calendar.new
  calendar.fill_slots
  calendar.display_slots
end

def book_day_hour(date_and_hour, student_name,teacher)
  calendar = Calendar.new
  calendar.fill_slots
  calendar.appointment(date_and_hour, student_name,teacher)
end

std_1 = creating_student.first.name
std_2 = creating_student[1].name
#reserv_day_hour("2022/2/26, 16:00", std_1, "Julie")
book_day_hour("2022/3/3, 9:00", std_2, "Mehdi")
#agenda_copleted