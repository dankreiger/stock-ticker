require 'httparty'
require 'nokogiri'


def stock_info(question)
	puts ""
	puts question
	puts "----------------------------"
	
	company = gets.chomp.downcase

	if company =~ /\s/
		company.gsub!(/\s+/, "+")
	end

	stock_find = HTTParty.get("http://www.reuters.com/search?blob=#{company}")
	dom_2 = Nokogiri::HTML(stock_find.body)

	puts ""
	
	quote_date = dom_2.xpath("//span[@class='priceDetailDate']").first
	puts "----------------------------"
	puts quote_date.content
	

	quote_time = dom_2.xpath("//span[@class='priceDetailDate']").last
	
	puts puts "Last update: " + quote_time.content
	

	puts ""
	# only span class with this title
	quote_current = dom_2.xpath("//span[@class='valueContentBase']").first
	puts "----------------------------"
	puts "Current: $" + quote_current.content
	puts "----------------------------"
	
	puts ""
	puts ""
	puts ""

rescue 
	puts ""
	puts "Sorry: Entry not recognized."
	puts ""
	puts "----------------------------"
	puts ""
	puts ""
	
end

puts ""
puts "---------------"
puts "Source: Reuters"
puts "---------------"
puts ""

puts "-------------------"
puts "ALIBABA STOCK INFO:"
puts "-------------------"
puts ""

ticker_response = HTTParty.get('http://www.reuters.com/search?blob=alibaba')
dom = Nokogiri::HTML(ticker_response.body) 

alib_date = dom.xpath("//span[@class='priceDetailDate']").first
puts alib_date.content

alib_time = dom.xpath("//span[@class='priceDetailDate']").last
puts puts "Last update: " + alib_time.content

puts ""
# only span class with this title - .first method for posterity
alib_current = dom.xpath("//span[@class='valueContentBase']").first
puts "Current: $" + alib_current.content


puts ""

stock_info("Please enter a company name:")