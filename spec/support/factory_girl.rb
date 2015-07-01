require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :beach do
    street1 "123 Main Street"
    street2 ""
    city "Boston"
    state "MA"
    zip "02155"
    name "Launch Beach"
    entrance_fee 13.33
    picture_url "http://www.google.com"
    description "Best beach ever."
    user
  end

  factory :amenity do
    sequence(:name) {|n| "Dogs Allowed #{n}" }
  end

  factory :beach_amenity do
    beach
    amenity
  end
end
