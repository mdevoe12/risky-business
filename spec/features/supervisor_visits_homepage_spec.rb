require 'rails_helper'

RSpec.feature "supervisor visits root" do
  scenario "they see 3 homepage tabs" do
    supervisor_1 = create(:supervisor)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor_1)

    visit '/'

    expect(page).to have_content("Today's Workers")
    expect(page).to have_content("Outstanding FLRAs")
    expect(page).to have_content("Outstanding Follow Ups")
  end

  scenario "they see today's workers" do
    supervisor_1 = create(:supervisor)
    w1, w2, w3, w4 = create_list(:worker, 4)
    today = Date.today
    another_day = Date.new(2017, 5, 11)
    create(:flra, worker: w1, supervisor: supervisor_1, created_at: another_day)
    create(:flra, worker: w2, supervisor: supervisor_1, created_at: Time.now)
    create(:flra, worker: w4, supervisor: supervisor_1, created_at: Time.now)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor_1)

    visit '/'

    expect(page).to have_content(w2.first_name)
    expect(page).to have_content(w2.last_name)
    expect(page).to have_content(w4.first_name)
    expect(page).to have_content(w2.last_name)

    expect(page).to_not have_content(w1.first_name)
    expect(page).to_not have_content(w3.first_name)
  end
end
