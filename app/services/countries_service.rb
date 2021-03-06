require 'open-uri'

class CountriesService
  def initialize
  end

  def call
    url = 'https://restcountries.eu/rest/v2/all'
    response = open(url).read
    repos = JSON.parse(response)
    repos.each do |repo|
      country = Country.new
      country.name = repo["name"]
      country.french_name = repo["translations"]["fr"]
      country.alpha2code = repo["alpha2Code"]
      country.alpha3code = repo["alpha3Code"]
      country.region = repo["region"]
      country.continent_id = Continent.find_by(name: repo["region"])
      country.flag_url = repo["flag"]
      country.save!
    end
  end

end
