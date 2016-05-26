require_relative './config/environment.rb'
require_relative './test.rb'
require 'open-uri'

#Scraper.indices_clear

	html = Nokogiri::HTML(open("http://washingtondc.craigslist.org/search/roo/"))
  	table_array = html.css('div.rows p.row')

	test = Scraper.new
	test.increment(table_array)
	
	
	
	
#	