require 'rails_helper'

RSpec.describe Beach, type: :model do
  let(:beach) { FactoryGirl.create(:beach) }

  describe "validations" do
    it { should validate_presence_of(:street1) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    subject {
      Beach.new(
        street1: "street1",
        city: "city",
        state: "state",
        zip: "zip",
        entrance_fee: 3.33,
        picture_url: "picture_url",
        description: "description",
        user_id: 1
      )
    }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:entrance_fee) }
    it { should validate_presence_of(:picture_url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user) }
  end

  describe "initialization" do
    it "returns a street1 string" do
      expect(beach.street1).to eq("123 Main Street")
    end
    it "returns a street2 string" do
      expect(beach.street2).to eq("")
    end
    it "returns a city string" do
      expect(beach.city).to eq("Boston")
    end
    it "returns a state string" do
      expect(beach.state).to eq("MA")
    end
    it "returns a zip string" do
      expect(beach.zip).to eq("02155")
    end
    it "returns a name string" do
      expect(beach.name).to include("Launch Beach")
    end
    it "returns a entrance_fee string" do
      expect(beach.entrance_fee).to eq(13.33)
    end
    it "returns a picture_url string" do
      expect(beach.picture_url).to eq("http://www.google.com")
    end
    it "returns a description string" do
      expect(beach.description).to eq("Best beach ever.")
    end
    it "returns a beach User" do
      expect(beach.user.class).to be(User)
    end
  end

end
