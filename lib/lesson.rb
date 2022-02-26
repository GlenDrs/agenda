# frozen_string_literal: true
require_relative 'teacher'

class Lesson
  attr_accessor :available
  attr_reader :teacher, :date, :start_time, :end_time

  def initialize(teacher, date, start_time, end_time)
    @teacher = teacher
    @date = date
    @start_time = start_time
    @end_time = end_time
    @available = true
  end

  def formatted_hours
    [start_time, end_time]
  end

end
