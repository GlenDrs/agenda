# frozen_string_literal: true
require_relative '../../lib/calendar'

RSpec.describe Calendar do
  it '#end_date' do
    expect(Calendar.new.end_date).to eq(Date.today + 7)
  end

end
