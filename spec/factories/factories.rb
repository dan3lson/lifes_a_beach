FactoryGirl.define do
  factory :beach do
    id 1
    street1 "123 Beach Drive"
    street2 "Apt. 5"
    city "Boston"
    state "MA"
    zip "01234"
    name "Tom Ford Beach"
    user_id 1
  end
end

FactoryGirl.define do
  factory :review do
    sequence(:id)
    rating 5
    description "hella awesome"
    sequence(:user_id)
    beach_id 1
    score 0
  end
end
