require 'rails_helper'

feature 'user searches for a beach', %{
  As a signed up user
  I want to search beaches
  So that I can find beaches I might want to visit
} do

# Acceptance Criteria:
# [x] User is able to navigate to a search page from any page
# [x] User is able to enter one or more keywords that search all fields in the
#     database as separate case insensitive keywords
# [x] User should be taken to a results page that displays all beaches that
#     match that search
# [x] User should be given an error message if they submit an empty search

  scenario 'user navigates to a search form' do
    visit root_path

    expect(page.has_selector?("form")).to be(true)
  end

  scenario 'user searches beaches by keyword' do
    beach1 = FactoryGirl.create(:beach)
    beach2 = Beach.create(
      street1: "blah",
      street2: "blah",
      city: "blah",
      state: "blah",
      zip: "02130",
      name: "blah",
      entrance_fee: 10.00,
      picture_url: "blah",
      description: "blah",
      user_id: 1
    )

    visit root_path
    fill_in "query", with: "blah"
    click_on "Search"

    expect(page).to have_content(beach2.name)
    expect(page).to_not have_content(beach1.name)
  end
end
