require 'nokogiri'
require 'open-uri'

class Moon
  def initalize
    @doc = ""
  end

  def first_full_moon_date(selected_year)
    @doc = Nokogiri::HTML(open("http://www.timeanddate.com/calendar/moonphases.html?year=#{selected_year}&n=0"))
    @date = @doc.at_css(get_correct_css_selector).content
    puts @date
  end

  def get_correct_css_selector
    case @doc.at_css("tbody >:nth-child(1) >:nth-child(6)").content
    when true
      "tbody >:nth-child(1) >:nth-child(6)"
    else
      "tbody >:nth-child(2) >:nth-child(6)"
    end
  end

  def get_input_year
    selected_year = gets.chomp    
    if vaild_year?(selected_year)
      first_full_moon_date(selected_year)
    else
      puts "#{selected_year} is invaild, please select a year between 1 and 2100"
      get_input_year
    end
  end

  def vaild_year?(selected_year)
    if (1..2100).member?(selected_year.to_i) 
      true
    else
      false
    end
  end 

end
# puts "To find out the first full mooon for a year please type the year (up to 2100)"
# Moon.new.get_input_year

