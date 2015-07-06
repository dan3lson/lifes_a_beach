require 'rails_helper'

require 'rails_helper'

RSpec.describe Downvote, type: :model do
  let(:downvote) { FactoryGirl.create(:downvote) }

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
      expect(downvote.user.class).to be(User)
      expect(downvote.review.class).to be(Review)
    end
  end
end
