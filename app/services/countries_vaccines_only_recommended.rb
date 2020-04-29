require 'csv'

class CountriesVaccinesOnlyRecommended
  def initialize
    @filepathr = 'lib/assets/countries_r.csv'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    @countries_r = []
  end

  def call
    CSV.foreach(@filepathr, @csv_options) do |row|
      @countries_r << row["Country Name"]
    # puts "R for #{row["Country Name"]}"
    end
    @countries_r
  end
end
