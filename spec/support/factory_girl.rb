require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :beach do
    street1 "123 Main Street"
    street2 ""
    city "Boston"
    state "MA"
    zip "02155"
    sequence(:name) { |n| "Launch Beach#{n}" }
    entrance_fee 13.33
    picture_url "picture_url"
    description "Best beach ever."
    user
  end

  factory :amenity do
    sequence(:name) { |n| "Dogs Allowed #{n}" }
  end

  factory :beach_amenity do
    beach
    amenity
  end

  factory :review do
    rating 5
    description "hella awesome"
    score 0

    user
    beach
  end

  factory :upvote do
    review
    user
  end

  factory :downvote do
    review
    user
  end
end
