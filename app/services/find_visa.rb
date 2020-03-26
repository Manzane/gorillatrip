require 'open-uri'
require 'nokogiri'


class FindVisa 
    def initialize
    end

    def foundCountry(country)
        if Country.find_by(french_name: country)
            Country.find_by(french_name: country)
        else
            Country.find_by(french_name: country.gsub(' ','-'))
        end
    end

    def call
        url = 'https://www.tourdumondiste.com/visas-tour-du-monde'

        file = open(url).read
        file_html = Nokogiri::HTML(file)

        visa = {}

        file_html.search('tr').each do |element|
            element.search('.col-pays').each do |col|
                country = col.text.strip
                visa_element = []
                element.search('td').each do |col|
                    visa_elem =  col.text.strip 
                    visa_element << visa_elem unless visa_elem == ""
                end
                Visa.create( {
                    name: visa_element[0],
                    category: "tourisme",
                    duration: visa_element[1],
                    price: visa_element[3],
                    country: foundCountry(country)
                })
            end
        end

        file_html.search('tr').each do |element|
            element.search('.pays').each do |col|
                country = col.text.strip
                visa_element = []

                element.search('td').each do |col|
                    visa_elem =  col.text.strip 
                    visa_element << visa_elem
                end

                Visa.create( {
                        name: "pvt",
                        age_max: visa_element[0][0..1].to_i,
                        category: "pvt",
                        duration: visa_element[1],
                        price: visa_element[7],
                        country: foundCountry(country)
                })
            end
        end
    end

end