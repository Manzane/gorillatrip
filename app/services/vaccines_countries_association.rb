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
    source = "Åàâçèéêîôùû "
    dest= "Aaaceeeiouu_"

  # puts chaine.tr(source, dest)

    @countries.each do |country|
      url = "https://planificateur.a-contresens.net/europe/pays-#{country.alpha2code}-#{country.french_name.tr(source, dest).downcase}.html#country-health"
      file = open(url).read
      file_html = Nokogiri::HTML(file)
      if file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase li")
        file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase li").each do |el|
          v = el.text.upcase.strip
          if Vaccine.find_by(name: v)
            country.vaccines << Vaccine.find_by(name: v)
            country.save!
          else
            puts "wrong name for #{v}"
          end
        end
      else
          puts "No div found on page for the country #{country}"
      end
    end

      # url = "db/pays-VN-viet_nam.html"
      # country = Country.find(245)
      # file = open(url).read
      # file_html = Nokogiri::HTML(file)

      # if file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase li")
      #   file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase li").each do |el|
      #     v = el.text.upcase.strip
      #     if Vaccine.find_by(name: v)
      #       country.vaccines << Vaccine.find_by(name: v)
      #       country.save!
      #     else
      #       puts "wrong name for #{v}"
      #     end
      #   end
      # else
      #     puts "No div found on page for the country #{country}"
      # end

  end
end


