require 'rails_helper'

feature 'admin deletes a review', %{
  As an admin
  I want to delete a review
  So that I can rid my site of inappropriate reviews
} do

  # Acceptance Criteria:
  # [x] If I am an admin, I can delete a reviews
  # [x] If I delete a review, I also delete its vote associations
  # [x] If I delete a review, I am given a success message

  scenario 'admin deletes a review' do
    beach = FactoryGirl.create(:beach)
    user1 = beach.user
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user2, beach: beach)
    FactoryGirl.create(:upvote, review: review, user: user1)
    FactoryGirl.create(:downvote, review: review, user: user3)

    admin = FactoryGirl.create(:user)
    admin.update_attribute :role, "admin"
    sign_in(admin)

    click_link beach.name
    click_on "delete-review#{review.id}"

    expect(page).to have_content('Review deleted successfully')
    expect(page).to_not have_content(review.description)
    expect(Review.count).to eq(0)
    expect(Downvote.count).to eq(0)
    expect(Upvote.count).to eq(0)
  end
end
