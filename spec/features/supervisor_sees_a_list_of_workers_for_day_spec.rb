require 'rails_helper'

RSpec.feature "supervisor visits workers index" do
  xscenario "they see a list of all workers for that day" do
    supervisor_1 = create(:supervisor)
    w1, w2, w3, w4 = create_list(:worker, 4)
    today = Date.today
    another_day = Date.new(2017, 5, 11)
    create(:task, worker: w1, supervisor: supervisor_1, created_at: another_day)
    create(:task, worker: w2, supervisor: supervisor_1, created_at: today)
    create(:task, worker: w4, supervisor: supervisor_1, created_at: today)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor_1)

    visit '/workers'

    expect(page).to have_content(w2.first_name)
    expect(page).to have_content(w2.last_name)
    expect(page).to have_content(w4.first_name)
    expect(page).to have_content(w2.last_name)

    expect(page).to_not have_content(w1.first_name)
    expect(page).to_not have_content(w3.first_name)
  end
end
