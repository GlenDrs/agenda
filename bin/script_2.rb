require_relative '../lib/teacher'
require_relative '../lib/student'
require_relative '../lib/lesson'
require_relative '../lib/calendar'

def select_day(date_selected)
  calendar = Calendar.new
  calendar.fill_slots
  calendar.choose_date(date_selected)
end

select_day("2022/02/27")
