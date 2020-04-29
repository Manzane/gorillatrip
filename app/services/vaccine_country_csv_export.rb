require 'csv'

class VaccineCountryCsvExport

  # file = 'lib/assets/vaccines_export3.csv'
  # headers = ["Country Id", "Country Name"]
  # def call
    systs = VaccineCountry.where("systematic = true")
    non_systs = VaccineCountry.where("systematic = false")
    array = []
    systs.each do |syst|
      non_systs.each do |non_syst|
        if (syst.vaccine_id == non_syst.vaccine_id && syst.country_id == non_syst.country_id)
          country = Country.find(syst.country_id)
          vaccine = Vaccine.find(syst.vaccine_id)
          array << [country.french_name]
        end
      end
    end
    array = array.uniq
    array = array.flatten
    p array.count
  # end

    # CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
    #   array.each do |a|
    #     writer << [a[0],a[1]]
    #   end
    # end
end
