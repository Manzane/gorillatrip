class VaccinesCountriesAssociation

  def initialize
    @countries = Country.all
    @vaccines = Vaccine.all
    @only_recommended = CountriesVaccinesOnlyRecommended.new.call
    @only_systematic = CountriesVaccinesOnlySystematic.new.call
  end

  def call
    source = "ÅàâçèÈÉéêëÎîïôùû', "
    dest = "aaaceeeeeeiiiouu___"

    @countries.each do |country|
      url = "https://planificateur.a-contresens.net/europe/pays-#{country.alpha2code}-#{country.french_name.tr(source, dest).downcase}.html#country-health"
      file = open(url).read
      file_html = Nokogiri::HTML(file)
      div = file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase li")
      if !div.empty?
        # binding.pry
        #liste pays casse bonbons if
        uls = file_html.search("div#country-health.col-md-12.padding-xxs-hr div.stat-panel.bordered div.stat-row div.stat-cell ul.text-uppercase")
        if @only_systematic.include?(country.french_name)
          ul1 = uls.first
          ul1.search("li").each do |el|
            # binding.pry
            v = el.text.upcase.strip
            vaccine = Vaccine.find_by(name: v)
            if vaccine
              vc = VaccineCountry.new(vaccine_id: vaccine.id, country_id: country.id, systematic: true )
              vc.save!
              puts "ok only S pour #{country.id} #{country.french_name}"
            end
          end
        elsif @only_recommended.include?(country.french_name)
          ul2 = uls.last
          ul2.search("li").each do |el|
              # binding.pry
            v = el.text.upcase.strip
            vaccine = Vaccine.find_by(name: v)
            if vaccine
              vc = VaccineCountry.new(vaccine_id: vaccine.id, country_id: country.id, systematic: false )
              vc.save!
              puts "ok only R pour #{country.id} #{country.french_name}"
            end
          end
        else
          ul1 = uls.first
          ul1.search("li").each do |el|
              # binding.pry
            v = el.text.upcase.strip
            vaccine = Vaccine.find_by(name: v)
            if vaccine
              vc = VaccineCountry.new(vaccine_id: vaccine.id, country_id: country.id, systematic: true )
              vc.save!
              puts "ok (S) pour #{country.id} #{country.french_name}"
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
              puts "ok (R) pour #{country.id} #{country.french_name}"
            end
          end
        end
      else
        puts "No div found on page for the country #{country.id} #{country.french_name}"
      end
    end
  end
end
