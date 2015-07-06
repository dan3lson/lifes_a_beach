require 'rails_helper'

feature 'user searches for a beach', %{
  As a signed up user
  I want to search beaches
  So that I can find beaches I might want to visit
} do

# Acceptance Criteria:
# [x] User is able to navigate to a search page from any page
# [x] User is able to enter one or more keywords that search all string fields
#     in the beaches and amenities tables as separate case insensitive keywords
# [x] User should be taken to a results page that displays all beaches that
#     match that search
# [x] User should not be able to submit an empty search

  scenario 'user navigates to a search form' do
    visit root_path

    expect(page.has_selector?("form")).to be(true)
  end

  scenario 'user searches by one keyword' do
    beach_amenity = FactoryGirl.create(:beach_amenity)
    beach_amenity2 = FactoryGirl.create(:beach_amenity)
    beach1 = beach_amenity.beach
    beach2 = beach_amenity2.beach

    visit root_path
    fill_in "query", with: beach1.name.split.last
    click_on "Search"

    expect(page).to have_content(beach1.name)
    expect(page).to_not have_content(beach2.name)
  end

  scenario 'user searches by two keywords' do
    beach_amenity = FactoryGirl.create(:beach_amenity)
    beach_amenity2 = FactoryGirl.create(:beach_amenity)
    beach1 = beach_amenity.beach
    beach2 = beach_amenity2.beach

    visit root_path
    fill_in "query", with: beach2.name
    click_on "Search"

    expect(page).to have_content(beach2.name)
    expect(page).to_not have_content(beach1.name)
  end

  scenario 'user enters invalid information' do
    beach_amenity = FactoryGirl.create(:beach_amenity)
    beach = beach_amenity.beach

    visit root_path
    fill_in "query", with: "  "
    click_on "Search"

    expect(page).to have_content("Please enter one or more words")
    expect(page).to have_content(beach.name)
  end
end
