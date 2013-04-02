# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Publication.create(name: "Maclean's", 
				   abbreviation: "MAC", 
				   url: "www2.macleans.ca",
				   default_author: "macleans.ca",
				   wp_version: "3.0")
Publication.create(name: "Canadian Business", 
				   abbreviation: "CB", 
				   url: "canadianbusiness.com",
				   default_author: "CB Staff",
				   wp_version: "3.5")
Publication.create(name: "Moneysense", 
				   abbreviation: "MS", 
				   url: "moneysense.ca",
				   default_author: "moneysense.ca",
				   wp_version: "3.0")
Publication.create(name: "Maclean's DEV", 
				   abbreviation: "MAC", 
				   url: "dev-www.macleans.ca",
				   default_author: "macleans.ca",
				   wp_version: "3.0")