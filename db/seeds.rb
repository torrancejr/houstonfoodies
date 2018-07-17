# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
Truck.destroy_all

response = RestClient.get 'https://api.yelp.com/v3/businesses/search?location=Houston&categories=foodtrucks', {:Authorization => ENV['YELP_KEY']}

trucks = JSON.parse(response)
trucks["businesses"].each do |truck|
  Truck.create!(
    name: truck["name"],
    location: truck["location"]["address1"],
    website: truck["url"],
    photo: truck["image_url"],
    rating: truck["rating"]
  )
  end