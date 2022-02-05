# frozen_string_literal: true
require 'date'
require_relative 'lesson'

class Calendar
  attr_reader :lesson, :teacher
  attr_accessor :date_time
  def initialize(lesson, datetime)
    @date_time = date_time
  end
end
