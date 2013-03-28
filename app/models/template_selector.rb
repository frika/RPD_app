class TemplateSelector < ActiveRecord::Base
# Templates for Maclean's
	def self.mac(doc, rb_file, pub)
		if doc.xpath("//nitf/body/sections").text == "From the editors" || 
			doc.xpath("//nitf/body/sections").text == "From the Editors"
			puts "working on: " + rb_file + " - editor template"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/editors_article.xsl"))

		elsif doc.xpath("//nitf/body/sections").text == "This week" && 
					doc.xpath("//nitf/body/body.head/hedline").text == "Good News"
					puts "working on: " + rb_file + " - good news template"
					xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/good_news.xsl"))

		elsif doc.xpath("//nitf/body/sections").text == "Letters" ||
					doc.xpath("//nitf/body/sections").text == "Letters"
					puts "working on: " + rb_file + " - letters template"
					xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/letters.xsl"))

		elsif doc.xpath("//nitf/body/sections").text == "Interview"
					puts "working on: " + rb_file + " - interview template"
					xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/interview.xsl"))

		elsif /Newsmakers/.match(doc.xpath("//nitf/body/body.head/hedline").text)
					puts "working on: " + rb_file + " - newsmakers template"
					xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/newsmakers.xsl"))
			    

    elsif doc.xpath("//nitf/body/sections").text == "Masthead"
      		puts "working on: " + rb_file + " - masthead template"
      		xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/masthead.xsl"))


    elsif doc.xpath("//nitf/body/sections").text == "Opinion"
      		puts "working on: " + rb_file + " - opinion template"
					xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/opinion.xsl"))
    
  	elsif doc.xpath("//nitf/body/body.head/hedline").text == "Capital diary" ||
        	doc.xpath("//nitf/body/body.head").text.split(" ")[0..1].join == "CapitalDiary"
	      	puts "working on: " + rb_file + " - capital diary template"
	        xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/capitaldiary.xsl"))
   
    elsif doc.xpath("//nitf/body/sections").text == "Film" || 
          doc.xpath("//nitf/body/sections").text == "Taste" ||
          doc.xpath("//nitf/body/sections").text == "Bazaar" ||
          doc.xpath("//nitf/body/sections").text == "Art" ||
          doc.xpath("//nitf/body/sections").text == "Help" ||
          doc.xpath("//nitf/body/sections").text == "Architecture" ||
          doc.xpath("//nitf/body/sections").text == "Music" ||
          doc.xpath("//nitf/body/sections").text == "Travel" ||
          doc.xpath("//nitf/body/sections").text == "Web" ||
          doc.xpath("//nitf/body/sections").text == "Humour" ||
          doc.xpath("//nitf/body/sections").text == "Media" ||
          doc.xpath("//nitf/body/sections").text == "TV" ||
          doc.xpath("//nitf/body/sections").text == "Radio" ||
          doc.xpath("//nitf/body/sections").text == "Stage" ||
          doc.xpath("//nitf/body/sections").text == "Exhibit" ||
          doc.xpath("//nitf/body/sections").text == "Feschuk"
	        puts "working on: " + rb_file + " - backpages template"
	        xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/backpages.xsl"))
    
    elsif doc.xpath("//nitf/body/sections").text == "Books"
	        puts "working on: " + rb_file + " - books template"
	        xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/books.xsl"))
    
		else 
	    puts "working on: " + rb_file + " - standard"
	    xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/standard_article.xsl"))
		end
	end

# Templates for Canadian Business
	def self.cb(doc, rb_file, pub)
		if /Editor/i.match(doc.xpath("//nitf/body/sections").text)
			puts "working on: " + rb_file + " - Editor"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/editor.xsl"))
		elsif /Letters/i.match(doc.xpath("//nitf/body/sections").text) ||
					/Letters/i.match(doc.xpath("//nitf/body/body.head/hedline").text) 
			puts "working on: " + rb_file + " - Letters"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/letters.xsl"))
		elsif /Briefing/i.match(doc.xpath("//nitf/body/sections").text)
			puts "working on: " + rb_file + " - Briefing"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/briefing.xsl"))
		elsif /_briefing_/i.match(rb_file) && !/Briefing/i.match(doc.xpath("//nitf/body/sections").text)
			puts "working on: " + rb_file + " - Provincial"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/provincial.xsl"))	
		elsif /Comment/i.match(doc.xpath("//nitf/body/sections").text) ||
					/comment/i.match(rb_file)
			puts "working on: " + rb_file + " - Comment"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/comment.xsl"))
		elsif /(?=.*Winner)(?=.*Loser).*/i.match(doc.xpath("//nitf/head/pubdata/@position.section").text)
			puts "working on: " + rb_file + " - Winners"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/winners.xsl"))
		elsif /Investing/i.match(doc.xpath("//nitf/body/sections").text)
			puts "working on: " + rb_file + " - Investing"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/investing.xsl"))
		elsif /feat/i.match(rb_file)
			puts "working on: " + rb_file + " - Feature"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/feature.xsl"))
		elsif /big_pic/i.match(rb_file)
			puts "working on: " + rb_file + " - Big Picture"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/bigpicture.xsl"))
		elsif /Easy Sell/i.match(doc.xpath("//nitf/body/body.head/hedline").text) && /Informer/i.match(doc.xpath("//nitf/body/sections").text)
			puts "working on: " + rb_file + " - Easy Sell"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/easysell.xsl"))
		elsif /_info_/i.match(rb_file) || /Informer/i.match(doc.xpath("//nitf/body/sections").text)
			puts "working on: " + rb_file + " - Informer"
			xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/informer.xsl"))
		else
			puts "working on: " + rb_file + " - standard"
		  xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/standard_article.xsl"))
		end
	end

# Templates for Moneysense
	def self.ms(doc, rb_file, pub)
		puts "working on: " + rb_file + " - standard"
	  xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/standard_article.xsl"))
	end
end