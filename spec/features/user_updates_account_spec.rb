require 'rails_helper'

feature 'user updates account information', %{
  As a visitor
  I want to update my account information
  So that I can change the information that is displayed
} do

  # Acceptance Criteria:
  # [x] I must specify a valid email address, password, and password
  #     confirmation
  # [x] If I don't specify the required information, I am presented with
  #     an error message

  scenario 'provide valid registration information' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link 'Change Account Information'

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'fakefake'
    fill_in 'Password confirmation', with: 'fakefake'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provides invalid registration information' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link 'Change Account Information'

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'fake'
    fill_in 'Password confirmation', with: 'fake'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    expect(page).to have_content('Password is too short')
    expect(page).to have_content('Sign Out')
  end
end
