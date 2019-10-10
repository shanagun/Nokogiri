require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def crypto_price
 tab_price = []
 page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
 page.xpath('//td/a[@class ="price"]').each do |price| #Xpath qui permet d'aller chercher tous les liens répértoriés sous la class "price"
 tab_price << price.text #On garde uniquement le texte des liens récupérés plus haut et on les push dans l'array tab_price
 end
 return tab_price
end

def crypto_name
  tab_name = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  page.xpath('//td//span/a[@class ="link-secondary"]').each do |name| #Xpath qui permet d'aller chercher tous les liens répértoriés sous la class "link-secondary"
  tab_name << name.text #On garde uniquement le texte des liens récupérés plus haut et on les push dans l'array tab_name
   end
   return tab_name
end

def perform 
  tab_end = []
  tab_price = crypto_price
  tab_name = crypto_name
  hash = Hash[tab_name.zip tab_price] #Cette ligne nous permet de "zip" 2 arrays dans un seul hash
  hash.each do |nom, valeur| #Dans le hash créé plus haut pour chaque "key,value" nom = nom de la crypto et b = sa valeur 
    myhash = {}
    myhash[nom] = valeur
    tab_end << myhash #On push myhash dans le array tab_end
  end
  puts "#{tab_end}"
end

perform