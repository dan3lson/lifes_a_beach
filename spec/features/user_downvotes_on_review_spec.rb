require 'rails_helper'

feature 'user downvotes on a review', %{
  As an authenticated user
  I want to downvote or remove my downvote
  on the review of a beach
} do

  describe 'User downvotes on a review' do
    scenario 'user clicks downvote', js: true do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit beach_path(beach)

      click_on 'Downvote'
      sleep 1

      expect(review.score).to eq(-1)
    end
    scenario 'user clicks remove downvote', js: true do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit beach_path(beach)

      click_on 'Downvote'
      sleep 1
      click_on 'Delete Downvote'
      sleep 1

      expect(review.score).to eq(0)
    end
  end
end
