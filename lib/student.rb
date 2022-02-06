# frozen_string_literal: true

class Student
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def display_name
    p "Le nom de l'étudiant est: #{@name}"
  end
end
