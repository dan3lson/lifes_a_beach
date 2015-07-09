require 'rails_helper'

feature 'user signs in', %{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do
  describe "user signs in" do
    let!(:beach) { FactoryGirl.create(:beach) }
    let!(:beach2) { FactoryGirl.create(:beach) }
    let!(:beach3) { FactoryGirl.create(:beach) }

    scenario 'specify valid credentials' do
      user = FactoryGirl.create(:user)

      sign_in(user)

      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Sign Out')
    end

    scenario 'specify invalid credentials' do
      visit new_user_session_path

      click_button 'Log in'
      expect(page).to have_content('Invalid email or password')
      expect(page).to_not have_content('Sign Out')
    end
  end
end
