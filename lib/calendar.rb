# frozen_string_literal: true
require 'date'
require_relative 'lesson'

class Calendar
  attr_reader :start_date
  attr_accessor :teachers, :time_slots

  def initialize
    @start_date = Date.today
    @time_slots = {
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
      saturday: [],
      sunday: []
      }
    @teachers = [Teacher.new('Julie'), Teacher.new('Mehdi')]
  end

  def available_slots
    time_slots
  end

  def display_slots
      (Date.today..Date.today + 6).each do |day|
      (time_slots[day.strftime("%A").downcase.to_sym]).map {|lesson| lesson.formatted_hours }
      end
  end

  def agenda_days
    (Date.today..Date.today + 6).each do |day|
      day2 = (time_slots[day.strftime("%A").downcase.to_sym]).map {|lesson| lesson.formatted_hours }
      p  "||---#{day.strftime("%A")}----"
      day2.each do |hour_day|
        p "|| Lesson #{hour_day[0]} - #{hour_day[1]} :<>: "
      end
    end
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
    time_slots[day_now.strftime("%A").downcase.to_sym].push(new_lesson(teacher, day_now, hour))
  end
end
