require 'rails_helper'

feature 'user deletes account information', %{
  As a visitor
  I want to delete my account
  So that my account is deleted
} do

  # Acceptance Criteria:
  # [x] I am able to delete my account

  describe "user deletes acct" do
    let!(:beach) { FactoryGirl.create(:beach) }
    let!(:beach2) { FactoryGirl.create(:beach) }
    let!(:beach3) { FactoryGirl.create(:beach) }
    
    scenario 'provide valid registration information' do
      user = FactoryGirl.create(:user)

      sign_in(user)

      click_on 'My Profile'

      click_on 'Delete My Account'

      expect(page).to have_content('Bye')
    end
  end
end
