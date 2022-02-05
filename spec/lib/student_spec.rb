# frozen_string_literal: true

require_relative '../../lib/student'

RSpec.describe Student do
  it '#display_name' do
    expect(Student.new("test_name").display_name).to eq("Le nom de l'étudiant est: test_name")
  end

end
