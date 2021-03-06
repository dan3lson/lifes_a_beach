require 'rails_helper'

feature 'user creates a review', %{
  As an authenticated user
  I want to add a review of a beach
  So that others can see what I think
} do

  # Acceptance Criteria
  # [x] User must submit a rating, optionally a description
  # [x] If they submit incomplete information, then they get an error and the
  #     form page rerenders
  # [x] If there's more than one review, show a list

  scenario 'authenticated user visits attempts to add a review' do
    beach = FactoryGirl.create(:beach)
    user = beach.user
    sign_in(user)

    first(:link, beach.name).click

    expect(page).to have_content("Write a Review")
  end

  scenario 'unauthenticated user attempts to add a review' do
    beach = FactoryGirl.create(:beach)

    visit root_path

    first(:link, beach.name).click

    click_link "Write a Review"

    expect(page).to have_content("Log in")
  end

  scenario 'user submits new review for a beach' do
    beach = FactoryGirl.create(:beach)
    user = beach.user
    sign_in(user)

    first(:link, beach.name).click

    click_link 'Write a Review'

    select 'Great - 5', from: 'Rating'
    fill_in "Description", with: "Best beach ever"
    click_button "Submit"

    expect(page).to have_content("Best beach ever")
  end

  scenario 'user submits incomplete information for a review for a beach' do
    beach = FactoryGirl.create(:beach)
    user = beach.user
    sign_in(user)

    first(:link, beach.name).click

    click_link 'Write a Review'

    click_button "Submit"
    expect(page).to have_content("can\'t be blank")
  end

  scenario 'users submits two reviews for one beach' do
    beach = FactoryGirl.create(:beach)
    user = FactoryGirl.create(:user)

    visit root_path

    login_as(user, scope: :user, run_callbacks: false)

    visit new_beach_review_path(beach)

    select 'Great - 5', from: 'Rating'
    fill_in "Description", with: "Best beach ever"
    click_button "Submit"

    visit new_beach_review_path(beach)

    select 'Great - 5', from: 'Rating'
    fill_in "Description", with: "Best beach ever"
    click_button "Submit"

    expect(page).to have_content("User can only submit one review for a beach.")
  end

  scenario 'user views multiple reviews on beaches show page' do
    beach = FactoryGirl.create(:beach)
    review1 = FactoryGirl.create(:review, beach: beach)
    review2 = FactoryGirl.create(:review, beach: beach)

    visit beach_path(beach)

    expect(page).to have_content(review1.description)
    expect(page).to have_content(review2.description)
  end
end
