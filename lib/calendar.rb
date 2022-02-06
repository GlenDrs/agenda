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
      if day_now.monday?
        teachers.each do |teacher|
          @time_slots.push(Lesson.new(teacher, day_now,'9','10'))
        end
      end
    end
  end

end
