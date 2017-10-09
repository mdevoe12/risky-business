require 'rails_helper'

RSpec.feature "supervisor visits follow up page" do
  scenario "they see the flra details" do
    supervisor = create(:supervisor)
    flra = create(:flra, supervisor: supervisor, follow_up_status: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor)

    visit '/'

    click_on(flra.created_at)
  end
end
