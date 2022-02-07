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

  def display_slots
    #Afficher slots
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
    @time_slots.push(new_lesson(teacher, day_now, hour))
  end

end
