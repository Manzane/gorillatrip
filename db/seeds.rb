# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Delete countries"
Country.destroy_all
puts "Countries deleted"

puts "Delete users"
User.destroy_all
puts "users deleted"

puts "Delete travels"
Travel.destroy_all
puts "Travels deleted"

puts "Delete Travel_countries"
TravelCountry.destroy_all
puts "Travel_countries deleted"

puts "Delete visas"
Visa.destroy_all
puts "Visas deleted"

puts "Delete vaccines"
Vaccine.destroy_all
puts "Vaccines deleted"


puts "Create countries"
CountriesService.new.call
puts "Countries created"



puts "Create users"
paul = User.new(
  username: "Paul Aroïd",
  email: "aroidpaul364@gmail.com",
  password: "Photo364",
  phone_number: "06.21.43.65.98",
  nationality: "fr",
  gender: "m",
  age: 26
)
paul.save!

marie = User.new(
  username: "Marie",
  email: "marie@marie.com",
  password: "123456",
  phone_number: "06.21.43.65.98",
  nationality: "fr",
  gender: "f",
  age: 32
)
marie.save!
puts "Users created"



puts "Create travels"
travel1 = Travel.new(
  name: "Inde",
  travel_start_date: DateTime.strptime("05/14/2020 8:00", "%m/%d/%Y %H:%M"),
  travel_end_date: DateTime.strptime("06/14/2020 8:00", "%m/%d/%Y %H:%M"),
  user: paul
)
travel1.save!

travel2 = Travel.new(
  name: "Asie",
  travel_start_date: DateTime.strptime("05/10/2020 8:00", "%m/%d/%Y %H:%M"),
  travel_end_date: DateTime.strptime("07/10/2020 8:00", "%m/%d/%Y %H:%M"),
  user: marie
)
travel2.save!
puts "Travels created"




puts "Create travel_countries"
paultravel  = TravelCountry.new(
  duration: 30,
  country: Country.find_by(alpha2code: "IN"),
  travel: travel1
)
paultravel.save!


thai = TravelCountry.new(
  duration: 10,
  country: Country.find_by(alpha2code: "TH"),
  travel: travel2
)
thai.save!

cambo = TravelCountry.new(
  duration: 20,
  country: Country.find_by(alpha2code: "KH"),
  travel: travel2
)
cambo.save!

laos = TravelCountry.new(
  duration: 15,
  country: Country.find_by(alpha2code: "LA"),
  travel: travel2
)
laos.save!
puts "travel_countries for paul (travel1) et marie (travel2) created"




puts "Create visas"
visa1 = Visa.new(
  name: "Visa Touriste Inde",
  category: "Touriste",
  deliverance_max_date: DateTime.strptime("04/20/2020 8:00", "%m/%d/%Y %H:%M"),
  duration: 30,
  price: 4000,
  country: Country.find_by(alpha2code: "IN")
)
visa1.save!

visa2 = Visa.new(
  name: "Visa Touriste Inde",
  category: "Touriste ++",
  deliverance_max_date: DateTime.strptime("04/20/2020 8:00", "%m/%d/%Y %H:%M"),
  duration: 90,
  price: 12000,
  country: Country.find_by(alpha2code: "IN")
)
visa2.save!

visa3 = Visa.new(
  name: "Visa Touriste Thai",
  category: "Touriste",
  deliverance_max_date: DateTime.strptime("04/20/2020 8:00", "%m/%d/%Y %H:%M"),
  duration: 30,
  price: 4000,
  country: Country.find_by(alpha2code: "TH")
)
visa3.save!

visa4 = Visa.new(
  name: "Visa Touriste thai",
  category: "Touriste ++",
  deliverance_max_date: DateTime.strptime("04/20/2020 8:00", "%m/%d/%Y %H:%M"),
  duration: 90,
  price: 12000,
  country: Country.find_by(alpha2code: "TH")
)
visa4.save!

visa5 = Visa.new(
  name: "Visa Touriste Laos",
  category: "Touriste",
  deliverance_max_date: DateTime.strptime("04/26/2020 8:00", "%m/%d/%Y %H:%M"),
  duration: 30,
  price: 200,
  country: Country.find_by(alpha2code: "LA")
)
visa5.save!

visa6 = Visa.new(
  name: "Visa Touriste Cambo",
  category: "Touriste et Affaire",
  deliverance_max_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
  duration: 100,
  price: 2000,
  country: Country.find_by(alpha2code: "KH")
)
visa6.save!
puts "Visas created"




puts "Create vaccines"
traitement1 = Vaccine.new(
name: "Fievre jaune",
contraindications: "femme enceinte",
treatment_start_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
treatment_end_date: DateTime.strptime("05/30/2020 8:00", "%m/%d/%Y %H:%M"),
injection_max_date: nil,
price: 2000
)
traitement1.save!

ha = Vaccine.new(
name: "Hepatite A",
contraindications: "femme enceinte",
treatment_start_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
treatment_end_date: DateTime.strptime("05/30/2020 8:00", "%m/%d/%Y %H:%M"),
injection_max_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
price: 20000
)
ha.save!

hb = Vaccine.new(
name: "Hepatite B",
contraindications: "SEP",
treatment_start_date: DateTime.strptime("04/28/2020 8:00", "%m/%d/%Y %H:%M"),
treatment_end_date: DateTime.strptime("07/28/2020 8:00", "%m/%d/%Y %H:%M"),
injection_max_date: DateTime.strptime("04/28/2020 8:00", "%m/%d/%Y %H:%M"),
price: 20000
)
hb.save!
puts "Vaccines created"



puts "link vaccines to countries"

lao = Country.find_by(alpha2code: "LA")
lao.vaccines << hb
lao.vaccines << ha
lao.vaccines << traitement1
lao.save!

inde = Country.find_by(alpha2code: "IN")
inde.vaccines << hb
inde.vaccines << ha
inde.vaccines << traitement1
inde.save!

thail = Country.find_by(alpha2code: "TH")
thail.vaccines << hb
thail.save!

cambod = Country.find_by(alpha2code: "KH")
cambod.vaccines << ha
cambod.save!
puts "vaccines linked to countries"
puts "--------------"
puts "SEED DOOOOOONE"
