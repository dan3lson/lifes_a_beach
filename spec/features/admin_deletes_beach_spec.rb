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

  describe "admin delete's user's account" do
    let!(:beach) { FactoryGirl.create(:beach) }
    let!(:beach2) { FactoryGirl.create(:beach) }
    let!(:beach3) { FactoryGirl.create(:beach) }

    scenario 'admin deletes a beach' do
      beach_amenity = FactoryGirl.create(:beach_amenity)
      beach = beach_amenity.beach
      amenity = beach_amenity.amenity

      admin = FactoryGirl.create(:user, role: "admin")

      sign_in(admin)

      visit beaches_path

      first(:link, beach.name).click

      click_on "Delete Beach"

      expect(page).to have_content('Beach deleted successfully')
      expect(page).to_not have_content(beach.name)
      expect(Beach.count).to eq(3)
      expect(BeachAmenity.count).to eq(0)
    end
  end
end
