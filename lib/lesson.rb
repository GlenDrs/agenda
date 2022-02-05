# frozen_string_literal: true
require_relative 'teacher'
require_relative 'student'

class Lesson
  attr_reader :teacher, :student, :calendar
  @@all = []

  def initialize(teacher, student)
    @teacher = student
    @tacher = student
    # @@all << self ???
  end

  def self.all
    @@all
  end

  def new_calendar
    Calendar.new(self)
  end

end
