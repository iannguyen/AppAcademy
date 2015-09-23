# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Cat.create!(name: Faker::Name.name, color: Cat::COLORS.sample, sex: Cat::SEX.sample, birth_date: Faker::Date.between(10.years.ago, 5.years.ago))
end
