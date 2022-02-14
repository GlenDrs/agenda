require_relative '../lib/teacher'
require_relative '../lib/student'
require_relative '../lib/lesson'
require_relative '../lib/calendar'

calendar = Calendar.new
calendar.fill_slots
calendar.time_slots
calendar.display_slots
