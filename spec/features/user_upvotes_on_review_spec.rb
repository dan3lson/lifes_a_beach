require 'rails_helper'

feature 'user upvotes on a review', %{
  As an authenticated user
  I want to upvote or remove my upvote
  on the review of a beach
} do

  describe 'User upvotes on a review' do
    scenario 'user clicks upvote', js: true do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit beach_path(beach)

      click_on 'Upvote'
      sleep 1

      expect(review.score).to eq(1)
    end
    scenario 'user clicks remove upvote', js: true do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit beach_path(beach)

      click_on 'Upvote'
      sleep 1
      click_on 'Delete Upvote'
      sleep 1

      expect(review.score).to eq(0)
    end
  end
end
