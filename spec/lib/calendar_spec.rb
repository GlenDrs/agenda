# frozen_string_literal: true
require_relative '../../lib/calendar'

RSpec.describe Calendar do
  it '#start_date' do
    expect(described_class.new.start_date).to eq(Date.today)
  end

  it '#time_slots' do
    expect(described_class.new.time_slots).to be_a(Hash)
  end

end
