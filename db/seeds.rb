# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "### Open path."
doc = Nokogiri::HTML(open("http://englishfull.ru/grammatika/100-bazovyx-sushhestvitelnyx.html"))

pairs = doc.search('div#content table tr td')[1].css("span")
pairs.each do |pair|
  pair = pair.text.split(/[—-]/)
  Card.create(original_text: pair[0].strip, translated_text: pair[1].strip)
end
puts "### OK. Done."

