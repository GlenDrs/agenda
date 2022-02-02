# frozen_string_literal: true

require_relative '../../lib/teacher'

RSpec.describe Teacher do
  it '#display_name' do
    expect(Teacher.new("test_name").display_name).to eq("Le nom de professeur est: test_name")
  end

end
