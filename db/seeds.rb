# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

# puts "Delete Vaccine_countries"
# VaccineCountry.destroy_all
# puts "Vaccine_countries deleted"

# puts "Delete continents"
# Continent.destroy_all
# puts "Continents deleted"

# puts "Delete countries"
# Country.destroy_all
# puts "Countries deleted"

# puts "Delete users"
# User.destroy_all
# puts "users deleted"

# puts "Delete travels"
# Travel.destroy_all
# puts "Travels deleted"

# puts "Delete Travel_countries"
# TravelCountry.destroy_all
# puts "Travel_countries deleted"

puts "Delete visas"
Visa.destroy_all
puts "Visas deleted"

# puts "Delete vaccines"
# Vaccine.destroy_all
# puts "Vaccines deleted"

# # puts "delete vaccines_countries link"
# #   Country.all.each do |c|
# #   c.vaccines.clear
# #   end
# # puts "normally ok"

# puts "Create continents"
# asie = Continent.new(name: "Asia", fr_name: "Asie")
# asie.save!
# ap asie
# amerique = Continent.new(name: "Americas", fr_name: "Amérique")
# amerique.save!
# ap amerique
# europe = Continent.new(name: "Europe", fr_name: "Europe")
# europe.save!
# ap europe
# afrique = Continent.new(name: "Africa", fr_name: "Afrique")
# afrique.save!
# ap afrique
# oceania = Continent.new(name: "Oceania", fr_name: "Océanie")
# oceania.save!
# ap oceania
# polar = Continent.new(name: "Polar", fr_name: "Polaire")
# polar.save!
# ap polar
# puts "Continents created"

# # puts "Update continents"
# # asie = Continent.find_by(name: "Asia")
# # asie.update(fr_name: "Asie")
# # asie.save!
# # ap asie
# # amerique = Continent.find_by(name: "Americas")
# # amerique.update(fr_name: "Amérique")
# # amerique.save!
# # ap amerique
# # europe = Continent.find_by(name: "Europe")
# # europe.update(fr_name: "Europe")
# # europe.save!
# # ap europe
# # afrique = Continent.find_by(name: "Africa")
# # afrique.update(fr_name: "Afrique")
# # afrique.save!
# # ap afrique
# # oceania = Continent.find_by(name: "Oceania")
# # oceania.update(fr_name: "Océanie")
# # oceania.save!
# # ap oceania
# # polar = Continent.find_by(name: "Polar")
# # polar.update(fr_name: "Polaire")
# # polar.save!
# # ap polar
# # puts "Continents updated"



# # puts "Updates countries with continent id"
# # @countries = Country.all
# # @countries.each do |country|
# #   if !country.region.empty?
# #     continent = Continent.find_by(name: country.region)
# #     # binding.pry
# #     country.continent_id = continent.id.to_i
# #     if country.save!
# #       puts "Ok for #{country.name}"
# #     end
# #   end
# # end
# # puts "Countries updated"


# puts "Create countries"
# CountriesService.new.call
# Country.find_by(name: "Republic of Kosovo").update(french_name: "République du Kosovo")
# Country.find_by(name: "Congo (Democratic Republic of the)").update(french_name: "République du Congo")
# puts "Countries created"



# puts "Create users"
# paul = User.new(
#   username: "Paul Aroïd",
#   email: "aroidpaul364@gmail.com",
#   password: "Photo364",
#   phone_number: "06.21.43.65.98",
#   nationality: "fr",
#   gender: "m",
#   age: 26
# )
# paul.save!

# marie = User.new(
#   username: "Marie",
#   email: "marie@marie.com",
#   password: "123456",
#   phone_number: "06.21.43.65.98",
#   nationality: "fr",
#   gender: "f",
#   age: 32
# )
# marie.save!
# puts "Users created"



# puts "Create travels"
# travel1 = Travel.new(
#   name: "Inde",
#   travel_start_date: DateTime.strptime("05/14/2020 8:00", "%m/%d/%Y %H:%M"),
#   travel_end_date: DateTime.strptime("06/14/2020 8:00", "%m/%d/%Y %H:%M"),
#   user: paul
# )
# travel1.save!

# travel2 = Travel.new(
#   name: "Asie",
#   travel_start_date: DateTime.strptime("05/10/2020 8:00", "%m/%d/%Y %H:%M"),
#   travel_end_date: DateTime.strptime("07/10/2020 8:00", "%m/%d/%Y %H:%M"),
#   user: marie
# )
# travel2.save!
# puts "Travels created"




# puts "Create travel_countries"
# paultravel  = TravelCountry.new(
#   duration: 30,
#   start_date: DateTime.strptime("06/10/2020 8:00", "%m/%d/%Y %H:%M"),
#   end_date: DateTime.strptime("07/10/2020 8:00", "%m/%d/%Y %H:%M"),
#   country: Country.find_by(alpha2code: "IN"),
#   travel: travel1
# )
# paultravel.save!


# thai = TravelCountry.new(
#   duration: 10,
#   start_date: DateTime.strptime("07/01/2020 8:00", "%m/%d/%Y %H:%M"),
#   end_date: DateTime.strptime("07/10/2020 8:00", "%m/%d/%Y %H:%M"),
#   country: Country.find_by(alpha2code: "TH"),
#   travel: travel2
# )
# thai.save!

# cambo = TravelCountry.new(
#   duration: 20,
#   start_date: DateTime.strptime("04/01/2020 8:00", "%m/%d/%Y %H:%M"),
#   end_date: DateTime.strptime("04/20/2020 8:00", "%m/%d/%Y %H:%M"),
#   country: Country.find_by(alpha2code: "KH"),
#   travel: travel2
# )
# cambo.save!

# laos = TravelCountry.new(
#   duration: 15,
#   start_date: DateTime.strptime("04/15/2020 8:00", "%m/%d/%Y %H:%M"),
#   end_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
#   country: Country.find_by(alpha2code: "LA"),
#   travel: travel2
# )
# laos.save!
# puts "travel_countries for paul (travel1) et marie (travel2) created"



puts "Create visas"
# FindVisa.new.call
VisaCsvImport.new.call
PvtCsvImport.new.call
puts "Visa Created"



# puts "Create vaccines"
# VaccineCsvImport.new.call

# # traitement1 = Vaccine.new(
# # name: "Fievre jaune",
# # contraindications: "femme enceinte",
# # treatment_start_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
# # treatment_end_date: DateTime.strptime("05/30/2020 8:00", "%m/%d/%Y %H:%M"),
# # injection_max_date: nil,
# # price: 2000
# # )
# # traitement1.save!

# # ha = Vaccine.new(
# # name: "Hepatite A",
# # contraindications: "femme enceinte",
# # treatment_start_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
# # treatment_end_date: DateTime.strptime("05/30/2020 8:00", "%m/%d/%Y %H:%M"),
# # injection_max_date: DateTime.strptime("04/30/2020 8:00", "%m/%d/%Y %H:%M"),
# # price: 20000
# # )
# # ha.save!

# # hb = Vaccine.new(
# # name: "Hepatite B",
# # contraindications: "SEP",
# # treatment_start_date: DateTime.strptime("04/28/2020 8:00", "%m/%d/%Y %H:%M"),
# # treatment_end_date: DateTime.strptime("07/28/2020 8:00", "%m/%d/%Y %H:%M"),
# # injection_max_date: DateTime.strptime("04/28/2020 8:00", "%m/%d/%Y %H:%M"),
# # price: 20000
# # )
# # hb.save!
# puts "Vaccines created"


# puts "link vaccines to countries"
# VaccinesCountriesAssociation.new.call
# # VCAssociation.new.call

# # lao = Country.find_by(alpha2code: "LA")
# # lao.vaccines << hb
# # lao.vaccines << ha
# # lao.vaccines << traitement1
# # lao.save!

# # inde = Country.find_by(alpha2code: "IN")
# # inde.vaccines << hb
# # inde.vaccines << ha
# # inde.vaccines << traitement1
# # inde.save!

# # thail = Country.find_by(alpha2code: "TH")
# # thail.vaccines << hb
# # thail.save!

# # cambod = Country.find_by(alpha2code: "KH")
# # cambod.vaccines << ha
# # cambod.save!

# puts "Vaccines and countries linked"

# puts "--------------"
# puts "SEED DOOOOOONE"
