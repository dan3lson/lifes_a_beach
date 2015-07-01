require 'rails_helper'

RSpec.describe BeachAmenity, type: :model do
  let(:beach_amenity) { FactoryGirl.create(:beach_amenity) }

  describe "associations" do
    it { should belong_to(:amenity) }
    it { should belong_to(:beach) }
  end

  describe "validations" do
    it { should validate_presence_of(:beach) }
    it { should validate_presence_of(:amenity) }
  end

  describe "initialization" do
    it "returns foreign key classes" do
      expect(beach_amenity.beach.class).to be(Beach)
      expect(beach_amenity.amenity.class).to be(Amenity)
    end
  end
end
