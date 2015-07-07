require 'rails_helper'

feature 'admin deletes a beach', %{
  As an admin
  I want to delete a beach
  So that I can rid my site of inappropriate or nonexistent beaches
} do

  # Acceptance Criteria:
  # [x] If I am an admin, I can delete a beach
  # [x] If I delete a beach, I also delete all of its reviews and amenities
  #     associations

  scenario 'admin deletes a beach' do
    beach = FactoryGirl.create(:beach)
    amenity = FactoryGirl.create(:amenity)
    FactoryGirl.create(:beach_amenity, beach: beach, amenity: amenity)

    admin = FactoryGirl.create(:user)
    admin.update_attribute :role, "admin"
    sign_in(admin)

    click_link beach.name
    click_on "Delete Beach"

    expect(page).to have_content('Beach deleted successfully')
    expect(page).to_not have_content(beach.name)
    expect(Beach.count).to eq(0)
    expect(BeachAmenity.count).to eq(0)
  end
end
