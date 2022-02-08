# frozen_string_literal: true
require 'date'
require_relative 'lesson'

class Calendar
  attr_reader :start_date
  attr_accessor :teachers, :time_slots

  def initialize
    @start_date = Date.today
    @time_slots = []
    @teachers = [Teacher.new('Julie'), Teacher.new('Mehdi')]
  end

  def available_slots
    time_slots
  end

  def agenda_days
    day = []
    (0..6).each {|d| day.push((Date.today + d).strftime("%A"))}
    p "||---Lessons-----#{day[0]}-----#{day[1]}-----#{day[2]}-----#{day[3]}-----#{day[4]}-----#{day[5]}-----#{day[6]}---||"
    p "||                                                                                                      ||"
    p "|| Lesson 1 :<>: #{display_slots[2][0]} - #{display_slots[2][1]}  :<>: #{display_slots[11][0]} - #{display_slots[11][1]}                                          "
    p "|| Lesson 2 :<>: #{display_slots[3][0]} - #{display_slots[3][1]} :<>: #{display_slots[12][0]} - #{display_slots[12][1]}                                        "
    p "|| Lesson 3 :<>: #{display_slots[4][0]} - #{display_slots[4][1]} :<>: #{display_slots[13][0]} - #{display_slots[13][1]}                                        "
    p "|| Lesson 4 :<>: #{display_slots[5][0]} - #{display_slots[5][1]} :<>: #{display_slots[14][0]} - #{display_slots[14][1]}                                        "
    p "|| Lesson 5 :<>: #{display_slots[6][0]} - #{display_slots[6][1]} :<>: #{display_slots[15][0]} - #{display_slots[15][1]}                                        "
    p "|| Lesson 6 :<>: #{display_slots[7][0]} - #{display_slots[7][1]} :<>: #{display_slots[16][0]} - #{display_slots[16][1]}                                        "
    p "|| Lesson 7 :<>: #{display_slots[8][0]} - #{display_slots[8][1]} :<>: #{display_slots[17][0]} - #{display_slots[17][1]}                                        "
    p "|| Lesson 8 :<>: #{display_slots[9][0]} - #{display_slots[9][1]} :<>: #{display_slots[18][0]} - #{display_slots[18][1]}                                        "
    p "|| Lesson 9 :<>: #{display_slots[10][0]} - #{display_slots[10][1]} :<>: #{display_slots[19][0]} - #{display_slots[19][1]}                                        "
    p "||________________________________________________________________________________________________________"
  end

  def display_slots
    lesson_hours = [[],[]]
    ending_hours = []
    time_slots.find_all {|lesson| lesson_hours.push([lesson.start_time, lesson.end_time]) }
    lesson_hours
  end

  def end_date
    start_date + 7
  end

  def fill_slots
    7.times do |i|
      day_now = start_date + i
      teachers.each do |teacher|
        case day_now.strftime("%A")
        when "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"
          [9..13, 15..18].each do |half_day|
            half_day.each { |hour| push_time_slots(teacher, day_now, hour) }
          end
        when "Saturday", "Sunday"
          [9..11, 15..16].each do |half_day|
            half_day.each { |hour| push_time_slots(teacher, day_now, hour) }
          end
        end
      end
    end
  end

  private

  def new_lesson(teacher, day_now, hour)
    Lesson.new(teacher, day_now, hour, hour + 1)
  end

  def push_time_slots(teacher, day_now, hour)
    time_slots.push(new_lesson(teacher, day_now, hour))
  end

end
