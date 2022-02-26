# frozen_string_literal: true
require_relative '../../lib/calendar'

RSpec.describe Calendar do
  subject(:calendar) { described_class.new }

  it '#start_date' do
    expect(calendar.start_date).to eq(Date.today)
  end

  describe '#time_slots' do
    it 'Is an Hash' do
      expect(calendar.time_slots).to be_a(Hash)
    end

    it 'Is an Hash with week days with empty time slots' do
      expect(calendar.time_slots.values.sample).to be_empty
    end
  end

  it '#teachers' do
    expect(calendar.teachers.sample).to be_a Teacher
  end
end
