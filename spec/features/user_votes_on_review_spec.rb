require 'rails_helper'

feature 'user upvotes on a review', %{
  As an authenticated user
  I want to upvote on the review of a beach
} do

  describe 'User votes on a review' do
    scenario 'user upvotes' do
      # beach = FactoryGirl.create(:beach)
      review = FactoryGirl.create(:review)
      beach = review.beach

      visit '/'
      click_on beach.name
      click_on 'Upvote'
      #
      # review_score = review.score
      # binding.pry
      # visit beach_review_path(beach, review)

      expect(page).to have_content("Upvote created successfully.")
      expect(page).to_not have_content("Upvote not created successfully.")
      # expect(review_score).to eq(1)
    end
  end
end
