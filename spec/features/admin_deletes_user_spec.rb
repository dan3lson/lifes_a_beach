require 'rails_helper'

feature 'admin deletes a user', %{
  As an admin
  I want to delete a user
  So that I can rid my site of trolls
} do

  # Acceptance Criteria:
  # [ ] If I am an admin, I can delete any user's account
  # [ ] If I am not an admin, I can't delete another user's account

  scenario "admin delete's user's account" do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:user)
    admin.update_attribute :role, "admin"
    sign_in(admin)

    click_on('View All Users')

    expect(page).to have_content(user.email)

    click_link("delete-#{user.id}")

    expect(page).to have_content('User successfully deleted')
    expect(page).to_not have_content(user.email)
  end

  scenario "user cannot delete another user's account" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    expect(page).to_not have_content('View All Users')

    visit users_path

    expect(page).to_not have_content(user.email)
    expect(page).to_not have_content('Delete')
  end

end
