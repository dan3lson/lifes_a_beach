require 'rails_helper'

feature 'admin views a list of users', %{
  As an admin
  I want to view a list of all users
  So that I can see who is the users of the site are
} do

  # Acceptance Criteria:
  # [x] If a user has an admin role, they can view all users of the site

  scenario 'admin views list of all users' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    admin = User.create(
      email: "admin@admin.com",
      password: "password",
      password_confirmation: "password",
      role: "admin"
    )

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    click_link 'View All Users'

    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
    expect(page).to have_content(user3.email)
  end

  scenario 'user without admin role attempts to view list of all users' do
    user1 = FactoryGirl.create(:user)
    FactoryGirl.create(:user)
    FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'

    expect(page).to_not have_content('View All Users')
  end

end
