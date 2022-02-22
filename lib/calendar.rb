# frozen_string_literal: true
require 'date'
require_relative 'lesson'
require_relative 'student'
require 'time'

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
    (Date.today..end_date).each do |day|
      show_time_slots(day)
    end
  end

  def choose_date(day_choosed)
    p date =  Date.strptime(day_choosed, '%Y/%m/%d')
    today = Date.today
    if date.between?(today, end_date)
      show_time_slots(date)
    elsif date > end_date
      p "False à l'instent il n'y a pas encore des crénaux disponible"
    else
      p "False le jour chosit est déjà passé ou il n'existe pas"
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

  def appointmend(date_hour, student_name,teacher_name)
    reserve_lesson(date_hour, student_name,teacher_name)
  end

  private

  def new_lesson(teacher, day_now, hour)
    Lesson.new(teacher, day_now, hour, hour + 1)
  end

  def push_time_slots(teacher, day_now, hour)
    time_slots[day_now.strftime("%A").downcase.to_sym].push(new_lesson(teacher, day_now, hour))
  end

  def show_time_slots(day_data)
    p "||---#{day_data.strftime("%A")}----"
    (time_slots[day_data.strftime("%A").downcase.to_sym]).map do |lesson|
      hours_teachers = [lesson.formatted_hours, lesson.teacher.name]
      p "|| Lesson  #{hours_teachers[0][0]} - #{hours_teachers[0][1]} :<>: #{hours_teachers[1]} "
    end
  end

  def end_date
    Date.today + 6
  end

  def only_time_slots(reserve_day)
    (time_slots[reserve_day.strftime("%A").downcase.to_sym])
  end

  def reserve_lesson(date_hour, student_name, teacher_name)
    date_hr = Time.parse(date_hour)
    date = date_hr.to_date
    start_hour = date_hr.strftime("%H").to_i

    message_erreur = ""
    only_time_slots(date).each do |hour|
      if hour.start_time != start_hour
        message_erreur = "Erreur l'heure choisit ne correspond pas aux crénaux du jour"
      end
    end
    p message_erreur

      only_time_slots(date).keep_if { |hour_teacher|
    hour_teacher.teacher.name == teacher_name &&
    hour_teacher.start_time == start_hour
    }

    only_time_slots(date).each do |day_hour|
      if date.between?(Date.today, end_date)
        p "______________________________"
        p "Bonjour #{student_name}"
        p "Vous avez reservé votre lesson de la datte: #{day_hour.date}"
        p " dans le crénaux: #{day_hour.start_time} - #{day_hour.end_time}"
        p " le proffesseur qui va fair le cours est: #{day_hour.teacher.name} "
        p "______________________________"
      else
        p "Vous avez choisit une mauvaise datte: "
      end
    end
  end

end
