# frozen_string_literal: true
require 'date'
require_relative 'lesson'

class Calendar
  attr_reader :start_date
  attr_accessor :teachers

  def initialize
    @start_date = Date.today
    @time_slots = []
    @teachers = [Teacher.new('Julie'), Teacher.new('Mehdi')]
  end

  def available_slots
    p @time_slots
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
              @time_slots.push(Lesson.new(teacher, day_now,'9','10'))
              @time_slots.push(Lesson.new(teacher, day_now,'10','11'))
              @time_slots.push(Lesson.new(teacher, day_now,'11','12'))
              @time_slots.push(Lesson.new(teacher, day_now,'12','13'))
              @time_slots.push(Lesson.new(teacher, day_now,'13','14'))
              @time_slots.push(Lesson.new(teacher, day_now,'15','16'))
              @time_slots.push(Lesson.new(teacher, day_now,'16','17'))
              @time_slots.push(Lesson.new(teacher, day_now,'17','18'))
              @time_slots.push(Lesson.new(teacher, day_now,'18','19'))
          when "Saturday", "Sunday"
              @time_slots.push(Lesson.new(teacher, day_now,'9','10'))
              @time_slots.push(Lesson.new(teacher, day_now,'10','11'))
              @time_slots.push(Lesson.new(teacher, day_now,'11','12'))
              @time_slots.push(Lesson.new(teacher, day_now,'15','16'))
              @time_slots.push(Lesson.new(teacher, day_now,'16','17'))
        end
      end
    end
  end

end
