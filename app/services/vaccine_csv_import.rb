require 'csv'

class VaccineCsvImport
  def initialize
    @filepath = 'lib/assets/vaccines.csv'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  end

  def call
    counter = 0
    CSV.foreach(@filepath, @csv_options) do |row|
      vaccine = Vaccine.new
      vaccine.name = row["name"]
      vaccine.disease_description = row["disease_description"]
      vaccine.risks = row["risks"]
      vaccine.treatment_type = row["treatment_type"]
      vaccine.treatment = row["treatment"]
      vaccine.vaccine_schema = row["vaccine_schema"]
      vaccine.treatment_start = row["treatment_start"]
      vaccine.treatment_end = row["treatment_end"]
      vaccine.injection_max = row["injection_max"]
      vaccine.travel_advised = row["travel_advised"]
      vaccine.contraindications = row["contraindications"]
      counter += 1 if vaccine.save
    end
    return counter

  end
end
