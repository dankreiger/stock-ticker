require 'httparty'
require 'nokogiri'

def stock_finder(symbol)
  Nokogiri::HTML(HTTParty.get("http://www.reuters.com/finance/stocks/overview?symbol=#{symbol}"))
end

def stock_ticker
	begin print "\nPlease enter a company stock symbol: "
		symbol=gets.chomp.downcase.strip;symbol.gsub!(/\s+/, ".");dom = stock_finder(symbol)
		puts "\nLookup for: "+dom.css('#sectionTitle h1').text()+"\n\n"+dom.css("#headerQuoteContainer").text().gsub!(/[[:space:]]{2,}/, " | ").strip! ; "Source: Reuters"
	rescue 
		puts "\nSorry: Entry not recognized."
	end
end