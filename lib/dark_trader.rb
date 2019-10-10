require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def crypto_price
tab_price = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
page.xpath('//td/a[@class ="price"]').each do |price|    
tab_price << price.text
 end
 return tab_price
end

def crypto_name
  tab_name = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  page.xpath('//td//span/a[@class ="link-secondary"]').each do |name| 
  tab_name << name.text
   end
   return tab_name
end

def perform 
  tab_end = []
  tab_price = crypto_price
  tab_name = crypto_name
  hash = Hash[tab_name.zip tab_price]
  hash.each do |a, b|
    myhash = {}
    myhash[a] = b
    tab_end << myhash
  end
  puts "#{tab_end}"
end

perform