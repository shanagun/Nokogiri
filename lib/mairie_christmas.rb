require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def get_townhall_email(url) #Récupérer l'email de la marie depuis l'URL http://annuaire-des-mairies.com/NOM_DE_LA_VILLE
  list = {}
  url = url[1..-1]
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com' + url)) #On prend l'URL de base et on ajoute la partie manquante de l'URL afin de récupérer l'email de chaque mairie
  email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text #Xpath qui permet d'aller chercher l'élèment "email" sur la page
end

def get_townhall_urls
  urls = []
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  arr = page.xpath("//a[@class='lientxt']") #Xpath qui permet d'aller chercher le NOM_DE_LA_VILLE pour chaque ville
  arr.each do |link_name|
    list = {}
    txt = link_name.text
  email = get_townhall_email(link_name['href']) #NOM_DE_LA_VILLE est ajouté à l'URL http://annuaire-des-mairies.com/ afin de récupérer l'email de chaque ville
  list["nom"] = txt
  list["email"] = email
  urls << list
  end
  puts urls
end
get_townhall_urls