require 'rails_helper'

feature 'user deletes account information', %{
  As a visitor
  I want to delete my account
  So that my account is deleted
} do

  # Acceptance Criteria:
  # [x] I am able to delete my account

  scenario 'provide valid registration information' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link 'Change Account Information'

    click_button 'Cancel my account'

    expect(page).to have_content('Bye')
  end
end
