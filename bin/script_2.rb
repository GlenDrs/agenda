require_relative '../lib/teacher'
require_relative '../lib/student'
require_relative '../lib/lesson'
require_relative '../lib/calendar'

calendar = Calendar.new
calendar.fill_slots
#calendar.time_slots
calendar.agenda_days
calendar.choos_date( "2022/02/20" )
