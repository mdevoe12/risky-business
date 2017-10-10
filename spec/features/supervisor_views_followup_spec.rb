require 'rails_helper'

RSpec.feature "supervisor clicks on flra from follow up page" do
  before :each do
    supervisor = create(:supervisor)
    @flra = create(:flra, :with_responses, supervisor: supervisor, follow_up_status: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor)
  end

  scenario "they are redirected to flra show page and see details" do
    visit '/'
    click_on(@flra.created_at)

    expect(current_path).to eq("/flras/#{@flra.id}")
    expect(page).to have_content(@flra.description)
    expect(page).to have_content("FLRA ##{@flra.id}")
    expect(page).to have_content(@flra.worker.first_name)
    expect(page).to have_content(@flra.responses.first.body)
    expect(page).to have_content(@flra.responses.first.question.body)
    expect(page).to have_content(@flra.responses.last.body)
    expect(page).to have_content(@flra.responses.last.question.body)
    expect(page).to have_content("Worker Risk Score: #{@flra.worker_risk_score}")
    expect(page).to have_content(@flra.notes)
    expect(page).to have_content("Flagged for Follow Up")
    expect(page).to have_link("Mark as Resolved")
  end

  scenario "they can mark flra as resolved" do
    visit "/flras/#{@flra.id}"

    expect(page).to have_content("Flagged for Follow Up")
    click_on "Mark as Resolved"

    expect(page).to_not have_content("Flagged for Follow Up")
    expect(page).to have_content("Follow Up Resolved")
    expect(page).to_not have_link("Mark as Resolved")
  end

  scenario "they can add notes" do
    visit "/flras/#{@flra.id}"

    click_on "Add Notes"

    fill_in "notes", with: "new note!!"
    click_on "Submit"

    expect(page).to have_content("new note!!")
  end
end
