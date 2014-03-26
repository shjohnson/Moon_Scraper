require 'nokogiri'
require 'open-uri'

class Moon
  def initalize
    @doc = ""
  end

  def moon_cycle_file
    @doc = Nokogiri::HTML(open("http://www.timeanddate.com/calendar/moonphases.html?year=#{@selected_year}&n=0"))
    @date = @doc.at_css(moon_cycle_check).content
    puts @date
  end

  def moon_cycle_check
    case @doc.at_css("tbody >:nth-child(1) >:nth-child(6)").content
    when true
      "tbody >:nth-child(1) >:nth-child(6)"
    else
      "tbody >:nth-child(2) >:nth-child(6)"
    end
  end

  def year
    @selected_year = gets.chomp
    if @selected_year.to_i > 2100
      puts "#{@selected_year} is too high, please select a lower year"
      year
    else
      moon_cycle_file
    end
  end 

end
puts "To find out the first full mooon for a year please type the year (up to 2100)"
Moon.new.year

