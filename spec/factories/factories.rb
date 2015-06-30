require 'factory_girl_rails'
require 'faker'

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

  # factory :review do
  #
  #   question_id nil
  #   description {Faker::Lorem.paragraph(1)}
  #   user
  # end

end
