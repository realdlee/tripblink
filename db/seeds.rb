# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#encoding: utf-8
Region.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Region.table_name)
open("lib/assets/regions.txt").read.each_line do |line|
  name = line.chomp
  Region.find_or_create_by_name!(name)
end

Country.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Country.table_name)
open("lib/assets/countries.txt").read.each_line do |line|
    country_name, region_name = line.chomp.split("|")
    Country.where(name: country_name, region_id: Region.find_by_name(region_name).id).first_or_create
end

City.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(City.table_name)
open("lib/assets/cities.txt").read.each_line do |line|
  city_line = line.split(/[,$\-]/).map(&:strip).delete_if(&:empty?)
  city, country, backpacker_index=city_line[0], city_line[1], city_line[2]
  if Country.find_by_name(country).nil?
    puts "#{country} is returning nil"
  else
    City.where(name: city, country_id: Country.find_by_name(country).id, backpacker_index: backpacker_index).first_or_create
  end
end
