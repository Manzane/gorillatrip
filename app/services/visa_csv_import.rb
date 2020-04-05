require 'csv'

class VisaCsvImport
  def initialize
    @filepath = 'lib/assets/visas.csv'
    # @filepath2 = 'lib/assets/pvt.csv'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  end

  def foundCountry(country)
        if Country.find_by(french_name: country)
            Country.find_by(french_name: country)
        end
  end

  def call
    CSV.foreach(@filepath, @csv_options) do |row|
      Visa.create!({
                    name: row["name"],
                    extra_info: row["extra_info"],
                    duration: row["duration"],
                    duration_int: row["duration_int"],
                    price: row["price"],
                    validity: row["validity"],
                    application: row["application"],
                    embassy: row["embassy"],
                    fr_diplomacy: row["fr_diplomacy"],
                    country: foundCountry(row["country"])
                })
      puts "ok for #{row["country"]} "
      end
    puts "#{Visa.all.count} visas"
  end
end
