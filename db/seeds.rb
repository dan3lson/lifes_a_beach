# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# t.boolean :dog_allowed, default: false
# t.boolean :volleyball_court, default: false
# t.boolean :shower, default: false
# t.boolean :grill, default: false
# t.boolean :permit_required, default: false
# t.boolean :fishing, default: false
# t.boolean :picnic, default: false
# t.boolean :boardwalk, default: false
# t.boolean :parking, default: false
# t.boolean :food_vendor, default: false
# t.boolean :bathroom, default: false

Beach.create(street1: "123 Beach Drive", street2: "Apt. 5", city: "Boston", state: "MA", zip: "01234", name: "Tom Ford Beach", user_id: 1)
