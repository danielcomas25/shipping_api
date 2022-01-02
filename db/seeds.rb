# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
colissimo = Carrier.create(code: 'colissimo', delivery_promise: 3, saturday_deliveries: false, oversea_delay_threshold: 3000)
ups = Carrier.create(code: 'ups', delivery_promise: 2, saturday_deliveries: true, oversea_delay_threshold: 5000)

CountryDistance.create(country: 'FR', distance: { "US": 6000, "DK": 1000, "JP": 9500 })
CountryDistance.create(country: 'US', distance: { "FR": 6000, "DK": 5500, "JP": 11000 })
CountryDistance.create(country: 'DK', distance: { "US": 5500, "FR": 1000, "JP": 8500 })
CountryDistance.create(country: 'JP', distance: { "US": 11000, "DK": 8500, "FR": 9500 })