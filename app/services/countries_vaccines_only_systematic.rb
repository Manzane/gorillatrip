require 'csv'

class CountriesVaccinesOnlySystematic
  def initialize
    @filepaths = 'lib/assets/countries_s.csv'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    @countries_s = []
  end

  def call
    CSV.foreach(@filepaths, @csv_options) do |row|
      @countries_s << row["Country Name"]
    # puts "S for #{row["Country Name"]}"
    end
    @countries_s
  end
end
