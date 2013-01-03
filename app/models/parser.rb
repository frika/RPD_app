class Parser < ActiveRecord::Base
	require 'zip/zip'
	# helper methods
	def self.file_operations(rb_file, xslt, xml) # renames and saves .html file
		name = rb_file.gsub("public/issue/MAC01_2013_Jan14_XML_NITF/", "public/issue_html/").split(".").first + ".html"
		file = File.new(name, "w")
		file.write(xslt.transform(xml).to_html)
		file.close
	end
	def self.unzip_file(file, destination)
  	Zip::ZipFile.open(file) { |zip_file|
  		files = zip_file.select(&:file?)
  		files.reject!{|f| f.name =~ /\.DS_Store|__MACOSX|(^|\/)\._/ }
   		files.each { |f|
     		f_path=File.join(destination, f.name)
     		FileUtils.mkdir_p(File.dirname(f_path))
     		zip_file.extract(f, f_path) unless File.exist?(f_path)
   		}
  	}
	end
	def self.zip # check to see if a zip file already exists, if so, delete it
		zip = Dir.glob('public/issue_html/*.zip')
    if zip
      zip.each do |zip|
        File.delete(zip)
      end
    end
		folder = 'public/issue_html'
		files = Dir.glob('public/issue_html/*.html')
		Zip::ZipFile.open('public/issue_html/MAC' + (Time.now.strftime('%U').to_i + 1).to_s + '-' + Time.now.strftime('%y') + '.zip', Zip::ZipFile::CREATE) do |zipfile|
  		files.each do |filename|
    		zipfile.add(filename.gsub('public/issue_html/', ""), filename)
  		end
  		zipfile.add('images', 'public/issue/MAC01_2013_Jan14_XML_NITF/images/')
		end
	end

	def self.toc # combines all XML files and creates Table of contents from aggregate
		comb_xslt = Nokogiri::XSLT(File.read("public/xsl/comb.xsl"))
		comb = File.new('public/issue/master.xml', 'w')
		comb.write('<catalog>')
		Dir.glob('public/issue/**/*.xml') do |rb_file|
		  xml = Nokogiri(File.read(rb_file))
		  @doc = Nokogiri::XML(File.open(rb_file))
		  comb.write(comb_xslt.transform(xml).to_html)
		end 
		comb.write('</catalog>')
		comb.close
		toc_xml = Nokogiri(File.read('public/issue/master.xml'))
		toc_xslt = Nokogiri::XSLT(File.read("public/xsl/toc.xsl"))
		toc = File.new('public/issue_html/02_contents.html', 'w')
		toc.write(toc_xslt.transform(toc_xml).to_html)
		toc.close
	end



  def self.articles # Main parsing method for all articles
  	Dir.glob('public/issue/**/*.xml') do |rb_file|
			xml = Nokogiri(File.read(rb_file))
			@doc = Nokogiri::XML(File.open(rb_file))
		  if @doc.xpath("//nitf/body/sections").text == "From the editors" ||
   			 @doc.xpath("//nitf/body/sections").text == "From the Editors"
  			puts "working on: " + rb_file + " - editor template"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/editors_article.xsl"))
	
		  elsif @doc.xpath("//nitf/body/sections").text == "This week" && 
		        @doc.xpath("//nitf/body/body.head/hedline").text == "Good News"
  			puts "working on: " + rb_file + " - good news template"
	      xslt = Nokogiri::XSLT(File.read("public/xsl/good_news.xsl"))
	   
		  elsif @doc.xpath("//nitf/body/sections").text == "Letters" ||
		  			@doc.xpath("//nitf/body/sections").text == ""
		    puts "working on: " + rb_file + " - letters template"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/letters.xsl"))
	 
  		elsif @doc.xpath("//nitf/body/sections").text == "Interview"
        puts "working on: " + rb_file + " - interview template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/interview.xsl"))
      
		  elsif @doc.xpath("//nitf/body/body.head/hedline").text == "Newsmakers"
		    puts "working on: " + rb_file + " - newsmakers template"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/newsmakers.xsl"))
				    

      elsif @doc.xpath("//nitf/body/sections").text == "Masthead"
        puts "working on: " + rb_file + " - masthead template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/masthead.xsl"))
  

	    elsif @doc.xpath("//nitf/body/sections").text == "Opinion"
	      puts "working on: " + rb_file + " - opinion template"
	      xslt = Nokogiri::XSLT(File.read("public/xsl/opinion.xsl"))
	    
    	elsif @doc.xpath("//nitf/body/body.head/hedline").text == "Capital diary" ||
          	@doc.xpath("//nitf/body/body.head").text.split(" ")[0..1].join == "CapitalDiary"
      	puts "working on: " + rb_file + " - capital diary template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/capitaldiary.xsl"))
     
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
      
      elsif @doc.xpath("//nitf/body/sections").text == "Books"
        puts "working on: " + rb_file + " - books template"
        xslt = Nokogiri::XSLT(File.read("public/xsl/books.xsl"))
      
			else 
		    puts "working on: " + rb_file + " - standard"
		    xslt = Nokogiri::XSLT(File.read("public/xsl/standard_article.xsl"))

			end
				self.file_operations(rb_file, xslt, xml)
		end
	end

	def self.html_parse # executes necessary methods to complete issue
		self.toc
		self.articles
	end 	
end
