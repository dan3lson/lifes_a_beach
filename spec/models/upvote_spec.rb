require 'rails_helper'

require 'rails_helper'

RSpec.describe Upvote, type: :model do
  let(:upvote) { FactoryGirl.create(:upvote) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:review) }
  end

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:review) }
  end

  describe "initialization" do
    it "returns foreign key classes" do
      expect(upvote.user.class).to be(User)
      expect(upvote.review.class).to be(Review)
    end
  end
end
