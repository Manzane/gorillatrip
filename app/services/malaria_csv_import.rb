require 'csv'

class MalariaCsvImport
  def initialize
    @filepath = 'lib/assets/malaria.csv'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  end

  def foundCountry(country)
    Country.find_by(name: country)
  end

  def foundVaccine
    Vaccine.find_by(name: "PALUDISME")
  end

  def call
    CSV.foreach(@filepath, @csv_options) do |row|
      VaccineCountry.create!( {
                    country: foundCountry(row["country"]),
                    vaccine: foundVaccine
                })
    puts "palu in #{row["country"]}"
    end
  end
end
