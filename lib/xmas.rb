require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

# This function return the name of city
def get_city

  # city_name_array = []
  # Régister URL of the needed website
  page_url_region = "https://www.annuaire-des-mairies.com/herault.html"

  region_page = Nokogiri::HTML(open(page_url_region))

  # From the website, get an array of the city name, convert it to string, put in downcase and replace " " to "-" if any space
  return city_name_array = region_page.xpath("//a[contains(@class, 'lientxt')]/text()").map {|x| x.to_s.downcase.gsub(" ", "-") }
end


# This function return the email of each cities
def get_email (city_names)

  city_email_array = []

  # Loop on each cities in the array to get the email
  for n in 0...city_names.length

    # get each link to the depute
    page_url_city = "https://www.annuaire-des-mairies.com/34/#{city_names[n]}.html"

    city_page = Nokogiri::HTML(open(page_url_city))

    # If any bug when trying to get any email
    begin
      # Put each email in an array "city_email_array"
      city_email_array << city_page.xpath("//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()").to_s
    rescue => e
      city_email_array << " "
    end
  end

  # return the array of all emails
  return city_email_array
end


def get_end()
  # Merge city array with email array
  # result_array = []
  email_city_hashes = get_city.zip(get_email(get_city)).map! { |k, v| { k => v}} 
  # final = result_array.push(email_city_hashes)
  # p final
  return email_city_hashes
end

puts get_end