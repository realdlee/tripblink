# #tip save html to

# desc "intial fill db"
# task :initial_fill => :environment do
#   require 'mechanize'
#   # require 'open-uri'
#   # ActiveRecord::Base.connection.reset_pk_sequence!(Country.table_name)
#   agent = Mechanize.new
#   base_url = "http://www.triposo.com/guide"
#   page = agent.get(base_url)
#   country_errors, link_errors = []
#   asia_countries = page.search("#asia a").map(&:text)
#   asia_countries.each do |name|
#     country = Country.where(name: name.strip, region_id: Region.find_by_name("Asia").id ).first_or_create
#     #if country doesn't have an image yet
#   if country.image_file_size.nil?
#     #click on country link
#     #10 blank spaces on each side of the name
#     if page.link_with(text: "#{name}").present?
#       page.link_with(text: "#{name}").click
#       #save country image
#       begin
#         image_url = "http:"+agent.current_page.search(".main-header").collect {|n| n[:style]}[0].split("'")[1]
#         country.image = URI.parse(image_url)
#       rescue OpenURI::HTTPError => e
#         country_errors << country.name
#         puts "#{e} on #{image_url}."
#         puts "Sleeping ..."
#         sleep 60
#       else  #if no error raised
#         country.save
#         puts "Saved ..."
#         sleep 10
#       ensure
#         agent.back
#       end
#     else
#       link_errors << country.name
#     end
#   end


#     # destinations = page.search("#destination-list a").map(&:text).map(&:strip)
#     # destination_images = page.search('#destination-list img').links
#     # destinations.each do |d|
#     #   Destination.create(name: d, country_id: )

#     #   page.search("img").first.save "path/"
#     #   SAVE IMAGE
#     end
#   end
#   pacific_countries = page.search("#australia-and-pacific a").map(&:text).map(&:strip)
#   americas_countries = page.search("#americas a").map(&:text).map(&:strip)
#   europe_countries = page.search("#europe a").map(&:text).map(&:strip)
#   africa_acountries = page.search("#africa a").map(&:text).map(&:strip)

# end

# # def save_country_image(country, country_errors, link_errors, agent, page)
# #   #click on country link
# #   if page.link_with(text: "\n#{country.name}\n").click
# #     #save country image
# #     begin
# #       image_url = "http:"+agent.current_page.search(".main-header").collect {|n| n[:style]}[0].split("'")[1]
# #       country.image = URI.parse(image_url)
# #       country.save
# #       puts "Saved ..."
# #       sleep 10
# #     rescue OpenURI::HTTPError => e
# #       country_errors << country.name
# #       puts "HTTP Error. Sleeping ..."
# #       sleep 60
# #     end
# #     agent.back
# #   else
# #     link_errors << country.name
# #   end
# # end