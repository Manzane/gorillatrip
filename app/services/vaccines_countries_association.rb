class VaccinesCountriesAssociation

  def initialize
    @countries = Country.all
    @vaccines = Vaccine.all
  end

  # def foundCountry(country)
  #   if Country.find_by(french_name: country)
  #       Country.find_by(french_name: country)
  #   else
  #       Country.find_by(french_name: country.gsub(' ','-'))
  #   end
  # end

  # def foundVaccine(vaccine)
  #   if Vaccine.find_by(name: vaccine)
  #       Vaccine.find_by(name: vaccine)
  #   else
  #       Vaccine.find_by(name: vaccine.gsub(' ','-'))
  #   end
  # end

  def call
    source = "ÅàâçèÈÉéêëÎîïôùû', "
    dest = "aaaceeeeeeiiiouu___"

    @countries.each do |country|
      url = "https://planificateur.a-contresens.net/europe/pays-#{country.alpha2code}-#{country.french_name.tr(source, dest).downcase}.html#country-health"
      file = open(url).read
      file_html = Nokogiri::HTML(file)
      div = file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase li")
      # binding.pry
      if !div.empty?
        # binding.pry
        uls = file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase")
        ul1 = uls.first
        ul1.search("li").each do |el|
            # binding.pry
          v = el.text.upcase.strip
          vaccine = Vaccine.find_by(name: v)
          if vaccine
            vc = VaccineCountry.new(vaccine_id: vaccine.id, country_id: country.id, systematic: true )
            vc.save!
            puts "ok pour #{country.id} #{country.french_name}"
          end
        end
        ul2 = uls.last
        ul2.search("li").each do |el|
            # binding.pry
          v = el.text.upcase.strip
          vaccine = Vaccine.find_by(name: v)
          if vaccine
            vc = VaccineCountry.new(vaccine_id: vaccine.id, country_id: country.id, systematic: false )
            vc.save!
            puts "ok pour #{country.id} #{country.french_name}"
          end
        end
      else
        puts "No div found on page for the country #{country.id} #{country.french_name}"
      end
    end
  end
end
