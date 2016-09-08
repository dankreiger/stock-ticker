require "ticker/stockticker.rb"
require "test/unit"

class StockTickerTest < Test::Unit::TestCase

  def test_dax
    assert_equal("Recon Capital DAX Germany ETF (DAX.OQ)", stock_finder("dax").css('#sectionTitle h1').text())
  end
  
  def test_dji
    assert(stock_finder(".dji").css('#sectionTitle h1').text().include? "Dow Jones Industrial Average")    
  end

  def test_dlkjds
    assert_equal("", stock_finder("dlkjds").css('#sectionTitle h1').text())
  end  

end