require 'rails_helper'

RSpec.describe Amenity, type: :model do
  let(:amenity) { FactoryGirl.create(:amenity, name: "Swimming") }

  describe "associations" do
    it { should have_many(:beach_amenities) }
    it { should have_many(:beaches) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "initialization" do
    it "returns a name string" do
      expect(amenity.name).to eq("Swimming")
    end
  end

  describe "#Amenity#all_names" do
    it "returns all amenity names" do
      expect(Amenity.all_names.count).to eq(10)
    end
  end
end
