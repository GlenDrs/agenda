# frozen_string_literal: true

class Teacher
  def initialize(name)
    @name = name
  end

  def display_name
    p "Le nom de professeur est: #{@name}"
  end
end