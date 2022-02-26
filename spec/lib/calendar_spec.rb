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

  it '#display_slots' do
    expect(calendar.display_slots.first).to eq Date.today
    expect(calendar.display_slots.last).to eq (Date.today + 6)
  end

  it '#display_day' do
    expect(calendar.display_day(Date.today.strftime('%Y/%m/%d'))).to be_empty
  end

  it '#display_day' do
    calendar.fill_slots
    expect(calendar.display_day(Date.today.strftime('%Y/%m/%d'))).not_to be_empty
  end

  it '#display_day' do
    expect(calendar.display_day((Date.today + 8).strftime('%Y/%m/%d')))
    .to eq "Erreur le jour choisi n'est pas correct"
  end
end
