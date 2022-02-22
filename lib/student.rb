# frozen_string_literal: true
require 'date'
require_relative './calendar'

class Student
  attr_accessor :name, :date_hour
  attr_reader :calendar

  def initialize(name)
    @name = name
  end

  def display_name
    p "Le nom de l'étudiant est: #{name}"
  end

  private

end
