class CountriesService

  def initialize

  end

  def call

  require 'json'
  require "rest-client"

    response = RestClient.get 'https://restcountries.eu/rest/v2/all'
    repos = JSON.parse(response)
    repos.each do |repo|
      country = Country.new
      country.name = repo["name"]
      country.alpha2code = repo["alpha2Code"]
      country.alpha3code = repo["alpha3Code"]
      country.region = repo["region"]
      country.save!
    end
  end

end
