require 'rails_helper'

feature 'user creates a new beach', %{
  As a signed up user
  I want to sign in
  So that I can create a beach
} do

  describe 'user creates beach' do
    let!(:beach) { FactoryGirl.create(:beach) }
    let!(:beach2) { FactoryGirl.create(:beach) }
    let!(:beach3) { FactoryGirl.create(:beach) }

    scenario "all input fields are valid" do

      user = FactoryGirl.create(:user)
      amenities = FactoryGirl.create_list(:amenity, 5)
      sign_in(user)

      visit new_beach_path
      fill_in "Name", with: "Launch Academy"
      fill_in "Description", with: "description"
      fill_in "Street 1", with: "123 Main Street"
      fill_in "City", with: "city"
      fill_in "State", with: "state"
      fill_in "Zipcode", with: "zip"
      fill_in "Entrance Fee", with: 3.33
      attach_file "Picture URL", (
        "#{Rails.root}/spec/support/images/Plum_island.jpg"
      )
      select amenities.first.name, from: "amenities"
      click_on "Create Beach"

      expect(page).to have_content("Beach created successfully")
      expect(page).to_not have_content("error")
      expect(page).to have_content("123 Main Street")
      expect(page).to have_content("city")
      expect(page).to have_content("state")
      expect(page).to have_content("zip")
      expect(page).to have_content("Launch Academy")
      expect(page).to have_content(3.33)
      expect(page).to have_selector("img")
      expect(page).to have_content("description")
      expect(Beach.count).to eq(4)
    end

    scenario "all input fields are invalid" do
      user = FactoryGirl.create(:user)
      sign_in(user)

      visit new_beach_path
      fill_in "Name", with: ""
      fill_in "Description", with: ""
      fill_in "Street 1", with: ""
      fill_in "City", with: ""
      fill_in "State", with: ""
      fill_in "Zipcode", with: ""
      fill_in "Entrance Fee", with: nil
      click_on "Create Beach"

      expect(page).to_not have_content("Beach created successfully")
      expect(page).to have_content("Beach not created successfully")
      expect(page).to have_content("error")
      expect(Beach.count).to eq(3)
    end

    scenario "unauthenticated user attempts to create a beach" do
      visit root_path

      expect(page).to_not have_content("Create Beach")
    end
  end
end
