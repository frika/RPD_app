# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Publication.create(name: "Maclean's", abbreviation: "MAC", url: "www2.macleans.ca")
Publication.create(name: "Canadian Business", abbreviation: "CB", url: "canadianbusiness.com")
Publication.create(name: "Moneysense", abbreviation: "MS", url: "moneysense.ca")
Publication.create(name: "Maclean's DEV", abbreviation: "MAC", url: "dev-www.macleans.ca")