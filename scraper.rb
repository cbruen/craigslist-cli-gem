require_relative './config/environment.rb'
require 'open-uri'




class Scraper


 
def initialize(url_path)
	@one = 0
	@more = "more"
	@count = 1
	@url = url_path
	@nested = Nokogiri::HTML(open(@url)).css('div.rows p.row')
end

def list
	@nested[@one,20].each do |x|
			
		description = x.css('span.pl').text.split("?>  ")[1].match(/(?<=\d\s).*/).to_s[0,35] + "..."
		price = x.css('span.price').text
		
		length_first = 2-"#{@count}".length
		space_first = ""
		(1..length_first).each { |x| space_first+= " "}
		length_second = 41 - description.length
		space_second = ""
		(1..length_second).each {|x| space_second +=" "}
		
		puts "#{@count}.  " + space_first + description + space_second + price
		
		
		@count+=1
	end
end



def increment
	while @more == "more"
		self.list
		puts "\n\n\nType \"more\" to see more listings."
		@more = gets.chomp
		@one+=20
	end		  

end

end