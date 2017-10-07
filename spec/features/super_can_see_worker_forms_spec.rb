require "rails_helper"

RSpec.feature 'Supervisor visits worker show page' do
  scenario 'and sees the forms for a worker' do
    workers = create_list(:worker, 3)
    worker = workers.first
    supervisor = create(:supervisor)

    workers.each do |worker|
      worker.tasks << create_list(:task, 2, :with_responses, supervisor: supervisor)
      worker.tasks << create_list(:task, 2, :with_responses, created_at: 1.week.ago)
    end

    visit "/workers/#{worker.id}"

    expect(page).to have_css '.form', count: 2

    within first('.form') do
      expect(page).to have_css '.description'
      expect(page).to have_css '#question-1'
      expect(page).to have_css '#question-2'
      expect(page).to have_css '#question-3'
      expect(page).to have_css '#question-4'
    end
  end
end
