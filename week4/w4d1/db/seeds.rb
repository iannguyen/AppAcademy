# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
shiv = User.create!(username: 'shiv')
ian = User.create!(username: 'ian')
alex = User.create!(username: 'alex')
contact1 = Contact.create!(name: 'shiv parikh', email: 'shiv@aa.com', user_id: 2)
contact2 = Contact.create!(name: 'ian nguyen', email: 'ian@aa.com', user_id: 1)
contact3 = Contact.create!(name: 'alex russian', email: 'alex@aa.com', user_id: 1)

cs1 = ContactShare.create!(contact_id: 1, user_id: 3)
cs2 = ContactShare.create!(contact_id: 2, user_id: 3)
