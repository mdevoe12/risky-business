require "rails_helper"

RSpec.feature 'Supervisor visits worker show page' do
  scenario 'and sees the forms for a worker' do
    workers = create_list(:worker, 3)
    worker = workers.first
    other_worker = workers.last
    supervisor = create(:supervisor)

    workers.each do |worker|
      worker.flras << create_list(:flra, 2, :with_responses, supervisor: supervisor)
      worker.flras << create_list(:flra, 2, :with_responses, created_at: 1.week.ago)
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor)

    visit "/workers/#{worker.id}"

    expect(page).to have_css '.form', count: 2
    expect(page).to have_content(worker.flras.first.worker_risk_score)
    expect(page).to have_content(worker.flras.first.responses.first.body)

    expect(page).to_not have_content(other_worker.flras.first.worker_risk_score)
    expect(page).to_not have_content(other_worker.flras.first.responses.first.body)
  end
end
