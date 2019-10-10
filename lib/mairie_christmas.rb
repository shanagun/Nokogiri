require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def get_townhall_email(url)
  list = Hash.new
  url = url[1..-1]
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com' + url)) # On prend l'URL de base et on ajoute la partie manquante de l'URL afin de récupérer l'email de chaque mairie
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

def get_townhall_urls
  urls = Array.new
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  arr = page.xpath("//a[@class='lientxt']")
  arr.each do |link_name|
    list = Hash.new
    txt = link_name.text
  email = get_townhall_email(link_name['href'])
  list["nom"] = txt
  list["email"] = email
  urls << list
  end
  puts urls
end
get_townhall_urls