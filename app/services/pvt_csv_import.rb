require 'csv'

class PvtCsvImport
  def initialize
    # @filepath = 'lib/assets/visas.csv'
    @filepath = 'lib/assets/pvt.csv'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  end

  def call
    counter = 0
    CSV.foreach(@filepath, @csv_options) do |row|
      visa = Visa.new
      visa.name = row["name"]
      visa.age_max = row["age_max"]
      visa.duration = row["duration"]
      visa.duration_int = row["duration_int"]
      visa.validity = row["validity"]
      visa.price = row["price"]
      visa.application = row["application"]
      visa.embassy = row["embassy"]
      visa.fr_diplomacy = row["fr_diplomacy"]
      country = Country.find_by(:french_name == row["country"])
      visa.country = country
      counter += 1 if visa.save
    end
    puts "#{counter} pvt"
    return counter


  end
end
