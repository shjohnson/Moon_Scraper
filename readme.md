# Moon phase scraper:   The web page
# http://www.timeanddate.com/calendar/moonphases.html?year=2016&n=0 shows full
# moon dates for the specified year.   
# Ask for a year.   
# Use the Nokogiri gem to make the request for the right year and turn the HTTP response into a
# document we can ask questions about.

#   From the Nokogiri readme:   require 'open-uri'   doc = Nokogiri::HTML(open(my_url))

#   doc.at_css(".hero").content

#   Once you've got the doc, you can use css selectors to find the first full
#   moon for the year. Hint: it's always in either the 6th child of the 1st
#   row of tbody, or the 6th child of the second row of tbody. The CSS for
#   these two things is "tbody >:nth-child(1) >:nth-child(6)" and "tbody
#   >:nth-child(2) >:nth-child(6)" Output the month and day of the first full
#   moon for the specfied year.