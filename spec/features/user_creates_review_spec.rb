require 'rails_helper'

feature 'user creates a review', %Q{
  As an authenticated user
  I want to add a review of a beach
  So that others can see what I think
} do

  # Acceptance Criteria
  # [x] User must submit a rating, optionally a description
  # [x] If they submit incomplete information, then they get an error and the form page rerenders

  scenario 'user visits new review page for a beach' do
    beach = Beach.create(street1: "123 Beach Drive", street2: "Apt. 5", city: "Boston", state: "MA", zip: "01234", name: "Tom Ford Beach", user_id: 1)
    visit new_beach_review_path(beach)

    expect(page.has_selector?("form")).to be(true)
  end

  scenario 'user submits new review for a beach' do
    beach = Beach.create(street1: "123 Beach Drive", street2: "Apt. 5", city: "Boston", state: "MA", zip: "01234", name: "Tom Ford Beach", user_id: 1)
    user = FactoryGirl.create(:user)
    visit new_beach_review_path(beach)

    select 'Great - 5', from: 'Rating'
    fill_in "Description", with: "Best beach ever"
    click_button "Submit"

    expect(page).to have_content("Best beach ever")
  end

  scenario 'user submits incomplete information for a review for a beach' do
    beach = Beach.create(street1: "123 Beach Drive", street2: "Apt. 5", city: "Boston", state: "MA", zip: "01234", name: "Tom Ford Beach", user_id: 1)
    user = FactoryGirl.create(:user)
    visit new_beach_review_path(beach)

    click_button "Submit"
    expect(page).to have_content('Review information incomplete.')
  end
end
