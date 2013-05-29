#tip save html to
namespace :db do
  desc "images"
  task :initial_fill => :environment do
    require 'mechanize'
    # require 'open-uri'
    agent = Mechanize.new
    base_url = "http://www.triposo.com/guide"
    page = agent.get(base_url)
    country_errors, link_errors = []
    countries = page.search("#country-list a").map(&:text)

    countries.each do |name|
      if Country.find_by_name(name.strip)
        country = Country.find_by_name(name.strip)
        #if country doesn't have an image yet
        if country.image_file_size.nil?
          #click on country link
          if page.link_with(text: "#{name}").present?
            page.link_with(text: "#{name}").click
            #save country image
            begin
              image_url = "http:"+agent.current_page.search(".main-header").collect {|n| n[:style]}[0].split("'")[1]
              country.image = URI.parse(image_url)
            rescue OpenURI::HTTPError => e
              country_errors << country.name
              puts "#{e} on #{image_url}."
              puts "Sleeping ..."
              sleep 60
            else  #if no error raised
              file_name = country.image_file_name.split "."
              file_name[0] = country.name.parameterize.downcase
              country.image_file_name = [file_name[0], file_name[1]].join(".")
              country.save
              puts "Saved ..."
              sleep 10
            ensure
              agent.back
            end  #end of begin
          else
            link_errors << country.name
          end #end of link.present?
        end # end of if image.nil?
      end # end of if find by name
    end #end of do..each Country
  end  #end of task
end

    # destinations = page.search("#destination-list a").map(&:text).map(&:strip)
    # destination_images = page.search('#destination-list img').links
    # destinations.each do |d|
    #   Destination.create(name: d, country_id: )
    #   page.search("img").first.save "path/"
    #   SAVE IMAGE
# def save_country_image(country, country_errors, link_errors, agent, page)
#   #click on country link
#   if page.link_with(text: "\n#{country.name}\n").click
#     #save country image
#     begin
#       image_url = "http:"+agent.current_page.search(".main-header").collect {|n| n[:style]}[0].split("'")[1]
#       country.image = URI.parse(image_url)
#       country.save
#       puts "Saved ..."
#       sleep 10
#     rescue OpenURI::HTTPError => e
#       country_errors << country.name
#       puts "HTTP Error. Sleeping ..."
#       sleep 60
#     end
#     agent.back
#   else
#     link_errors << country.name
#   end
# end