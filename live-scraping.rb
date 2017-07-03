#scrape info form IMDB to generate txt files
require 'open-uri' #gem
require 'nokogiri' #gem

base_url = 'http://www.imdb.com'
url = 'http://www.imdb.com/chart/top'
file = open(url)
doc = Nokogiri::HTML(file)

# doc.search('.titleColumn').each do |element|
#   puts element.text
movies_doc = doc.search('.titleColumn a')
# puts movies_doc.first
# puts movies_doc.first.text
movies_doc[0..99].each do |movie_doc|
movie = { title: movie_doc.text }
movie[:url] = base_url + movie_doc.attributes["href"].value
movie_doc = Nokogiri::HTML(open(movie[:url]))
# puts movies_doc
movie[:release] = movie_doc.search('#titleYear').text.gsub('(','').gsub(')','')
movie[:duration] = movie_doc.search('.title_wrapper').search('time').text.strip
stars = movie_doc.search('.credit_summary_item')[2].search('a span').map { |star| star.text}
# puts movies_doc.class
# puts movies_doc.size
# puts movie[:duration]
movie[:stars] = "#{stars[0]}, #{stars[1]} and #{stars[2]}"
movie_text += "Title: #{movie[:title]}\n"
movie_text += "Release Date: #{move[:release]}\n"
movie_text += "Duration: #{movie[:duration]}\n"
movie_text += "Stars: #{movie[:stars]}\n"

filepath = "#{movie[:title].downcase.gsub(' ', '_')}"
File.open(filepath, 'w') do |file|
  file.write(movie_text)
puts "Successuly wrote #{filepath}."
end #end of .each do
# puts movies_doc.size
end
