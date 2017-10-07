require 'rails_helper'
RSpec.describe 'manager portal' do
  it 'shows dashboard with manager supervisors' do
    manager = Manager.create!(name: 'managername', password: 'password')
    visit root_path
    fill_in 'form-signin[text]', with: manager.name
    fill_in 'form-signin[password]', with: 'password'
    click_on 'login'

    expect(page).to have_content("Welcome, #{manager.name}")
    expect(page).to have_content('My supervisors')
  end
end
