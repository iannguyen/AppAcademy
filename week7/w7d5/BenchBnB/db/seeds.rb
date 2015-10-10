# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bench1 = Bench.create!({description: "Beautiful bench in Inner Sunset", lat: 37.762275, lng: -122.470999})
bench2 = Bench.create!({description: "Ugly bench in T-Loin", lat: 37.783387, lng: -122.417301})
bench3 = Bench.create!({description: "This bench can fit a Full House", lat: 37.775551, lng: -122.432665})
