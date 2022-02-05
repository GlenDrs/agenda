# frozen_string_literal: true
require_relative 'lesson'

class Student
  attr_reader :lesson, :teacher
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    # @@all << self ???
  end

  def display_name
    p "Le nom de l'étudiant est: #{@name}"
  end

  def new_lesson(teacher)
    Lesson.new(self,teacher)
  end

  def lessons
    Lesson.all.select{|lesson| lesson.teacher}
  end
end
