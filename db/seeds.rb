# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Region.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Region.table_name)
open("lib/assets/regions.txt").read.each_line do |line|
  name = line.chomp
  Region.find_or_create_by_name!(name)
end