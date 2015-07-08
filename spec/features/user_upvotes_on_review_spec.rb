require 'rails_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

feature 'user upvotes on a review', %{
  As an authenticated user
  I want to upvote or remove my upvote
  on the review of a beach
} do

  describe 'User upvotes on a review' do
    scenario 'user clicks upvote' do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit '/'
      click_on beach.name
      click_on 'Upvote'

      expect(page).to have_content("Upvote created successfully.")
      expect(page).to_not have_content("Upvote not created successfully.")
      expect(review.score).to eq(1)
    end
    scenario 'user clicks remove upvote' do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit '/'
      click_on beach.name
      click_on 'Upvote'
      click_on 'Delete Upvote'

      expect(page).to have_content("Upvote deleted successfully.")
      expect(page).to_not have_content("Upvote created successfully.")
      expect(review.score).to eq(0)
    end
  end
end
