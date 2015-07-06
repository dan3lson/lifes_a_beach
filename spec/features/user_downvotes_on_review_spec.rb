require 'rails_helper'

feature 'user downvotes on a review', %{
  As an authenticated user
  I want to downvote or remove my downvote
  on the review of a beach
} do

  describe 'User downvotes on a review' do
    scenario 'user clicks downvote' do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit '/'
      click_on beach.name
      click_on 'Downvote'

      expect(page).to have_content("Downvote created successfully.")
      expect(page).to_not have_content("Downvote not created successfully.")
      review.reload
      expect(review.score).to eq(-1)
    end
    scenario 'user clicks remove downvote' do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = review.user

      sign_in(user)

      visit '/'
      click_on beach.name
      click_on 'Downvote'
      click_on 'Delete Downvote'

      expect(page).to have_content("Downvote deleted successfully.")
      expect(page).to_not have_content("Downvote created successfully.")
      review.reload
      expect(review.score).to eq(0)
    end
  end
end
