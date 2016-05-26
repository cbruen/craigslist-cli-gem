require_relative './config/environment.rb'
require 'open-uri'




class Scraper


 
def initialize
	@one = 0
	@two = 20
	@more = "more"
	@count = 1
end

def list(table_array)
	
	table_array[@one,@two].each do |x|
			
		length_first = 2-"#{@count}".length
		space_first = ""
		(1..length_first).each { |x| space_first+= " "}
		binding.pry
		description = x.css('span.pl').text.split("?>  ")[1].match(/(?<=\d\s).*/).to_s[0,35] + "..."
		price = x.css('span.price').text
		length_second = 41 - description.length
		space_second = ""
		(1..length_second).each {|x| space_second +=" "}
		
		puts "#{@count}.  " + space_first + description + space_second + price
		
		
		@count+=1
	end
end



def increment(table_array)
	while @more == "more"
		self.list(table_array)
		puts "\n\n\nType \"more\" to see more listings."
		@more = gets.chomp
		@two+= 20
		@one+=20
	end		  

end

end