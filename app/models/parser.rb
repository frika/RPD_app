class Parser < ActiveRecord::Base
	
	def self.master
		comb_xslt = Nokogiri::XSLT(File.read("public/xsl/comb.xsl"))
		comb = File.new('public/issue/master.xml', 'w')
		comb.write('<catalog>')
		Dir.glob('public/issue/*.xml') do |rb_file|
		  xml = Nokogiri(File.read(rb_file))
		  @doc = Nokogiri::XML(File.open(rb_file))
		  comb.write(comb_xslt.transform(xml).to_html)
		end 
		comb.write('</catalog>')
		comb.close
	end

	def self.toc
		toc_xml = Nokogiri(File.read('public/issue/master.xml'))
		toc_xslt = Nokogiri::XSLT(File.read("public/xsl/toc.xsl"))
		toc = File.new('public/issue_html/02_contents.html', 'w')
		toc.write(toc_xslt.transform(toc_xml).to_html)
		toc.close
	end

	def self.file_name(rb_file)
		rb_file.gsub("public/issue/", "public/issue_html/").split(".").first + ".html"
	end

  def self.articles
  	Dir.glob('public/issue/*.xml') do |rb_file|
			xml = Nokogiri(File.read(rb_file))
			@doc = Nokogiri::XML(File.open(rb_file))
		  if @doc.xpath("//nitf/body/sections").text == "From the editors" ||
   			 @doc.xpath("//nitf/body/sections").text == "From the Editors"
  			puts "working on: " + rb_file + " - editor template"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/editors_article.xsl"))
		    file = File.new(self.file_name(rb_file), "w")
		    file.write(xslt.transform(xml).to_html)
		    file.close
		  elsif @doc.xpath("//nitf/body/sections").text == "This week" && 
		        @doc.xpath("//nitf/body/body.head/hedline").text == "Good News"
  			puts "working on: " + rb_file + " - good news template"
	      xslt = Nokogiri::XSLT(File.read("public/xsl/good_news.xsl"))
	      file = File.new(self.file_name(rb_file), "w")
	      file.write(xslt.transform(xml).to_html)
	      file.close
		  elsif @doc.xpath("//nitf/body/sections").text == "Letters" ||
		  			@doc.xpath("//nitf/body/sections").text == ""
		    puts "working on: " + rb_file + " - letters template"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/letters.xsl"))
	      file = File.new(self.file_name(rb_file), "w")
	      file.write(xslt.transform(xml).to_html)
	      file.close
  		elsif @doc.xpath("//nitf/body/sections").text == "Interview"
        puts "working on: " + rb_file + " - interview template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/interview.xsl"))
        file = File.new(self.file_name(rb_file), "w")
        file.write(xslt.transform(xml).to_html)
        file.close
		  elsif @doc.xpath("//nitf/body/body.head/hedline").text == "Newsmakers"
		    puts "working on: " + rb_file + " - newsmakers template"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/newsmakers.xsl"))
		    file = File.new(self.file_name(rb_file), "w")
		    file.write(xslt.transform(xml).to_html)
		    file.close

      elsif @doc.xpath("//nitf/body/sections").text == "Masthead"
        puts "working on: " + rb_file + " - masthead template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/masthead.xsl"))
        file = File.new(self.file_name(rb_file), "w")
        file.write(xslt.transform(xml).to_html)
        file.close

	    elsif @doc.xpath("//nitf/body/sections").text == "Opinion"
	      puts "working on: " + rb_file + " - opinion template"
	      xslt = Nokogiri::XSLT(File.read("public/xsl/opinion.xsl"))
	      file = File.new(self.file_name(rb_file), "w")
	      file.write(xslt.transform(xml).to_html)
	      file.close
    	elsif @doc.xpath("//nitf/body/body.head/hedline").text == "Capital diary" ||
          	@doc.xpath("//nitf/body/body.head").text.split(" ")[0..1].join == "CapitalDiary"
      	puts "working on: " + rb_file + " - capital diary template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/capitaldiary.xsl"))
        file = File.new(self.file_name(rb_file), "w")
        file.write(xslt.transform(xml).to_html)
        file.close
      elsif @doc.xpath("//nitf/body/sections").text == "Film" || 
            @doc.xpath("//nitf/body/sections").text == "Taste" ||
            @doc.xpath("//nitf/body/sections").text == "Bazaar" ||
            @doc.xpath("//nitf/body/sections").text == "Art" ||
            @doc.xpath("//nitf/body/sections").text == "Help" ||
            @doc.xpath("//nitf/body/sections").text == "Architecture" ||
            @doc.xpath("//nitf/body/sections").text == "Music" ||
            @doc.xpath("//nitf/body/sections").text == "Web" ||
            @doc.xpath("//nitf/body/sections").text == "Humour" ||
            @doc.xpath("//nitf/body/sections").text == "Media" ||
            @doc.xpath("//nitf/body/sections").text == "TV" ||
            @doc.xpath("//nitf/body/sections").text == "Radio" ||
            @doc.xpath("//nitf/body/sections").text == "Stage" ||
            @doc.xpath("//nitf/body/sections").text == "Exhibit" ||
            @doc.xpath("//nitf/body/sections").text == "Feschuk"
        puts "working on: " + rb_file + " - backpages template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/backpages.xsl"))
        file = File.new(self.file_name(rb_file), "w")
        file.write(xslt.transform(xml).to_html)
        file.close
      elsif @doc.xpath("//nitf/body/sections").text == "Books"
        puts "working on: " + rb_file + " - books template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/books.xsl"))
        file = File.new(self.file_name(rb_file), "w")
        file.write(xslt.transform(xml).to_html)
        file.close
			else 
		    puts "working on: " + rb_file + " - standard"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/standard_article.xsl"))
		    file = File.new(self.file_name(rb_file), "w")
		    file.write(xslt.transform(xml).to_html)
		    file.close
			end
		end
	end

	def self.html_parse
		self.master
		self.toc
		self.articles
	end 	
end
