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

  def display_slots
    (Date.today..Date.today + 6).each do |day|
      p "||---#{day.strftime("%A")}----"
      (time_slots[day.strftime("%A").downcase.to_sym]).map do |lesson|
        hours_teachers = [lesson.formatted_hours, lesson.teacher.name]
        p "|| Lesson  #{hours_teachers[0][0]} - #{hours_teachers[0][1]} :<>: #{hours_teachers[1]} "
      end
    end
  end

  def choos_date(day_choosed)
    p date =  Date.strptime(day_choosed, '%Y/%m/%d')
    today = Date.today
    if date.between?(today, today + 6)
      p  "||---#{date.strftime("%A")}----"
      p "La datte choisit est Ok"
    elsif date > today + 6
      p "False à l'instent il n'y a pas encore des crénaux disponible"
    else p "False le jour chosit est déjà passé ou il n'existe pas"
    end
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
