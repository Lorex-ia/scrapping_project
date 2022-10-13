require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'

# page = Nokogiri::HTML(URI.open("https://www.thehackingproject.org/"))
# result = page.xpath('//h1')

# puts result


# Exo 1
# Lehman Brothers, impressionnés par ton algorithme d'optimisation d'achat / vente, veut encore faire appel à toi. Leur Chief Digital Officer, très hype, a entendu parler au JT de TF1 d'un "truc révolutionnaire qui s'appelle le bloque-chienne". Il veut en acheter plein. Pour le conseiller, tu vas devoir récupérer le cours de toutes les cryptomonnaies du marché.
# En prenant pour source le site CoinMarketCap, fait un programme qui récupère le cours de toutes les cryptomonnaies et les enregistre bien proprement dans un array de hashs. 

# html_page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/").read)




#   token_results = html_page.search(".lhJnKD")
#   token_array = []

#   token_results.each do |token|
#     token_style = token.text.strip
#     token_array.push(token_style).delete_at(-11)
#   end
#   # p token_array

#   price_results = html_page.search(".cLgOOr")
#   price_array = []

#   price_results.each do |price|
#     price_style = price.text.strip
#     price_array.push(price_style).delete_at(-11)
#   end


# # Create the hash from the two arrays

#   crypto_hash = Hash[token_array.zip(price_array)]

# p crypto_hash





def trader()


    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    names_crypto = []
    page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div").each{|n|
        names_crypto.push(n.text)}

    
    valeur_crypto = []
    page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span").each{|v|
        valeur_crypto.push(v.text)}         

    array_crypto = names_crypto.zip(valeur_crypto).map! { |k, v| { k => v}}    

    return puts array_crypto

end    

trader