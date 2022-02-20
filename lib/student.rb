# frozen_string_literal: true
require 'date'
require 'time'
require_relative './calendar'

class Student
  attr_accessor :name, :date_hour
  attr_reader :calendar

  def initialize(name)
    @name = name
    @calendar = Calendar.new
  end

  def appointmend(date_hour, teacher_name)
    calendar.fill_slots
    reserve_lesson(date_hour, teacher_name)
  end

  def display_name
    p "Le nom de l'étudiant est: #{name}"
  end

  private

  def reserve_lesson(date_hour, teacher_name)
    date_hr = Time.parse(date_hour)
    date = date_hr.to_date
    start_hour = date_hr.strftime("%H").to_i

    calendar.only_time_slots(date).keep_if { |hour_teacher| 
    hour_teacher.teacher.name == teacher_name &&
    hour_teacher.start_time == start_hour}

    calendar.only_time_slots(date).map do |day_hour|
      if day_hour.date.between?(Date.today, Date.today + 6)
        p "______________________________"
        p "Bonjour #{name}"
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
