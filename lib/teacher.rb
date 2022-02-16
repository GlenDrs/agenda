# frozen_string_literal: true

class Teacher
  attr_reader :lesson, :student
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def display_name
    p "Le nom de professeur est: #{@name}"
  end

  def disponibility
    Calendar.create(self)
  end
end
